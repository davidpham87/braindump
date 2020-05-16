# Clojure for the brave and the true


## Parallel demons     :concurrency:

1.  Reference cell: Read and write a shared state.
2.  Mutual exclusion: Example with writing a log with several processes, e.g. concatenate &ldquo;ab&rdquo; and &ldquo;cd&rdquo; in a file results in &ldquo;acbd&rdquo;.
3.  Deadlock: On a table, every one has to take the left and right stick and the same time. However, there is only one stick per person. Leading to a deadlock.

Solutions to these are `future` (new thread), `delay` (like future but executed only at `deref` time), `promise` (empty memory location shared to all thread that will receive value only once with `deliver`). The advantage is all the execution are cached. **Note**: deference is done with either the `defer` function or the `@` sign in front of the variable.


## References type     :concurrency:epochal_time_model:

1.  `atom` are identities that can be set and shared by multiple threads. They use a set and compare algorithm, i.e. the `swap!` function modifies the value of the atom variable only if its values did not change between the beginning and the end of the transaction. `swap!` and `reset!` are the main function to work with atoms.
2.  `watch` are function with four arguments: a key (a keyword for identifying the process calling the watcher), a reference variable being watched, the old-state, and the new state.
    
    ```clojure
    (defn f [key watched old-state new-state] nil)
    ```
    
    A watcher function is attached to a reference type (e.g an atom) with the `add-watch` function having the following signature:
    
    ```clojure
    (def counter (atom 0))
    (add-watch counter :watching-counter watch-fn)
    ```

3.  Validators are functions that can check if new states are valid. They take as argument the atom and return a boolean. They are added to the atom as follow
    
    ```clojure
    (defn bigger-than-1 [x]
      (or (> x 1) (throw (IllegalStateException. "That's too small"))))
    (def account (atom 2 :validator bigger-than-1))
    (swap! account inc)
    (swap! account - 10) ;; Throw an error
    ```

4.  `ref` type are the ACI in the ACID accronym (atomic, consistent and isolated) and use *STM*. It means that either the operations between two refs happened correctly, or the transaction is aborted. `alter` and `dosync` are the key functions.
    
    -   In a transaction (that is the body of `dosync`), every `ref` keep their state to the transaction (invisible to outside threads) and when the transaction tries to commit, every `ref` checks if the value has been altered by other threads.
    -   If any of them has been change, then **none** of the `ref` are updated, and the transaction restart with the new value and commits only when the initial states has not been /alter/ed by other processes.
    
    `commute` also allow to change the state of a ref. However, at transaction time, if ref states have been altered, only the `commute` part is run again with the new states, which might lead to inconsistent state, but increased performance. `ensure` function protects refs from being modified by other transaction. This is helpful, when a transaction must modify only one refs, but the other related refs must not be altered by other transaction.
5.  `vars` are associations between symbols and objects. `^:dynamic` is a keyword in `def` to signal to clojure that a vars is dynamic. Varnames are enclosed around `*` (e.g. `*user-email*`) to show to other programmers that the variable is dynamic. `bindings` is a dynamic `let`. Dynamic vars are often use to name a resource that one ore more functions target. `set!` allows to change the state of the dynamic vars. `alter-var-root` allows to rebind a immutable vars (which is unadvised), and `with-redefs` allows to create local binding for testing.
6.  `pmap` and the following `ppmap` can be used to execute parallel task:
    
    ```clojure
    (defn ppmap
      "Partitioned pmap, for grouping map ops together to make parallel
      overehead worthwile"
      [grain-size f & colls]
      (apply concat
    	 (apply pmap
    		(fn [& pgroups] (doall (apply map f pgroups)))
    		(map (partial partition-all grain-size) colls))))
    ```


## core.async and channels     :core_async:

1.  `chan` creates a channel. And channel communicate through *messages*. One can **put** and **take** message. Processes wait for completion of their message. Process: Wait and do nothing until successful completion of either *put* or *take* from a channel. After success of the operation, continue.
2.  `go` and their blocks (*go blocks*) runs separately on a concurrent thread. `go` creates a process (i.e. its go block), which runs a pool of threads equal two plus the number of machines cores (avoiding the overhead of creating threads). Each `go block` only live until it reach the ends of its body.
3.  `<!` and `<!!` are the *take* function. It listen to the channel and wait until an another process puts a value in the channel which the *take* function returns. `>!` and `>!!` are the *put* function which always return true. It provides a message to a channel and wait until the message to be taken by another process before releasing resources. The number of `!` in the operation depends if one is inside a *go block* (one `!`) or not (two `!`). *Blocking* and *parking* waiting are key to understand the number of `!`. Parking wait allows a thread to handle several process (and this is only possible in a *go block*). When one of the process starts to wait, the thread put it aside and starts an another process until it starts to wait, and so on. Use `poll!` and `offer!` to have non blocking channel interactions in the REPL.
4.  Channel buffers are created as following:
    
    ```clojure
    (def buffer-size 2)
    (def channel-buffer (chan buffer-size))
    ```
    
    This means we can create 2 values without waiting for a response. `sliding-buffer` (FIFO) and `dropping-buffer` (LIFO) can be used to discard channel message without blocking.
5.  `close!` *closes* channel. A closed channel does not accept any puts anymore and after all the values have been retrieved, the subsequent takes return `nil`.
6.  `alts!!` lets us use the result of the first successful channel operation among a collection of channel operations. The elegant solution with `alts!!` is one can define a timeout
    
    ```clojure
    (let [[message channel] (alts!! [c1 c2 (timout 20)])] ;; c1 and c2 are predefined channels.
      (println message))
    ```
    
    if the timeout is the first to finish than `message` is `nil`. See `alt!` macro as well.
7.  Queues and pipelines (escaping the callback hell) are common patterns.


## Abstraction and polymorphism

1.  Multimethods
    
    ```clojure
    (defmulti method-name (fn [x] (:type x))) ;; or simplty :type, can be more complicated as well
    (defmethod method-name :hello [x] "Hello")
    (defmethod method-name :good-bye [x] "Good-bye")
    (defmethod method-name :default [x] "I don't know you")
    (method-name {:type :hello}) ; => Hello
    (method-name {:type :good-bye}) ; Good-bye
    (method-name {:type :what?}) ; => I don't know you
    ```
    
    One can also create hierarchies with `derive` and namespace keywords.
2.  A *protocol* allows to make dispatch by the type of the first argument and it is a collection of polymorphic operations (unlike multimethod which is just one function). Methods from protocols can not have a `& rest` argument. Key functions are `defprotocol`, `extend-type`, `extend-protocol` (for specifying for several type at once).
    -   Caveat: methods from protocols are property of the namespace and not from the object.
3.  Records are extension of `hash-map`.
    
    ```clojure
    (defrecord WereWolf [name title])
    (WereWolf. "David" "Master")
    (->WereWolf "David" "Master")
    (map->WereWolf  {:name "David" :title "Master"})
    ```
    
    On has to use the `:import:` statement in the `ns` macro in order to import records. One can access field through the keyword or the dot `.` macro.
    
    ```clojure
    (.name (WereWolf. "David" "Master")) ; "David"
    (:title (WereWolf. "David" "Master")) ; "Master"
    ```
    
    Any function on map works on record (although they do not retain their class if one `dissoc` or `assoc` them). Here is how one could extend a protocol.
    
    ```clojure
    (defprotocol WereCreature
      "Awesom Were"
      (full-moon-behavior [x] "Full-moon behavior"))
    
    (defrecord WereWolf [name title]
      WereCreature
      (full-moon-behavior [x] (str name " will kill everyone")))
    
    (full-moon-behavior (WereWolf. "David" "Master"))
    ```

4.  `deftype`, `reify`, `proxy`. reify is about implementing an anonymous protocol at runtime.


## Link

-   [Brave and the True](https://www.braveclojure.com/clojure-for-the-brave-and-true/)


## See also (generated)

-   [(](20200430235013-specs.md)
-   [Applied Clojure](20200430155637-applied_clojure.md)
-   [CLI Arguments](20200430154352-cli_arguments.md)
-   [Clojure](../decks/clojure.md)
-   [core.async](20200430155819-core_async.md)
-   [David Nolen](20200430141609-david_nolen.md)
-   [edn and transit](20200504212017-edn_and_transit.md)
-   [Life In Dynamic Typing](20200430141226-life_in_dynamic_typing.md)
-   [Mastering Clojure Macro](20200430155438-mastering_clojure_macro.md)
-   [Multiple Environment](20200430154528-multiple_environment.md)
-   [Org-roam-clj: Org-roam extension with Clojure](20200503222619-org_roam_clj.md)
-   [Parallel Programming in Clojure with Reducers](20200505112138-clojure_reducers.md)
-   [Simple Made Easy](20200502122138-simple_made_easy.md)
-   [TODO](../todo.md)
-   [Why Clojure?](20200504204808-why_clojure.md)
