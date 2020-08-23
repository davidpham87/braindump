# Mastering Clojure Macro

-   Macro is about manipulating the arguments of your functions before they get evaluated. We should think about templating when thinking about macros.
-   The macro returns a S-Expression which should be valid Clojure code.
-   Use `` ` `` for namespace quoting everything after the backquote (usually a list). Unquote is done through `~`. Unquote splicing `~@` allows to remove the parenthesis in a list and put them at the same level as the parent S-Expression. For example the following `` `(1 2 ~@(3 4) 5)` `` returns `(1 2 3 4 5)`.
-   Whenever we need to bind a symbol in a macro (e.g `fn` and `let`), the argument should be gensym, or symbol appended of a `#`, e.g `x#`.
-   `&form` [the calling expression] and `&env` [the binding environment] are special values only available in macros.
-   Disadvantage with macros. Macros are not values (as they are not functions). So we can&rsquo;t use `map` or any other function on them. Macros can be contagious as they can leak force your user to also write macros to use your library. They can be tough to get right (mainly because of side effect and computation time). We should avoid doing a mess in our user namespace whenever writing macros.
-   Macros are useful to evaluate code in Context. When using dynamic binding,
    
    ```clojure
    (declare ^:dynamic *radius*)
    (defn circle-area []
      (* Math/PI (* *radius* *radius*)))
    (binding [*radius* 10]
      (circle-area))
    ```
    
    it can be useful to abstract the binding step with a macro. Most common bindings are for `*out*`. In general, we should have the core of the manipulation of a macro written in a function, and have the smallest possible amount of lines of code into a the macro.
    
    ```clojure
    (defn with-out-file-fn [file body-fn]
      (with-open [writer (clojure.java.io/writer file :append true)]
        (binding [*out* writer]
          (body-fn))))
    
    (defn with-out-file [file & body]
      `(with-out-file-fn ~file
         (fn [] ~@body)))
    ```
    
    Macro can also decide how we evaluate (or not) the input, e.g. `comment`. A cool trick for a function that should be executed only once
    
    ```clojure
    (let [x :a
          f (^:once fn* [] (println x))]
      (f)  ;; prints :a
      (f)) ;; prints nil
    ```
    
    Macros can also rescuing errors and clean up resources. The main point is macros allow to eliminate noisy details of cleaning up an open resource, rescuing errors, or setting up dynamic bindings or other context for evaluation. It allows to abstract away the contextual details and core operations can be clarified to make the purpose of the code more obvious.
-   Optimization. Before optimizing, we should know how to benchmark. `criterium.core` is a nice solution for that. Macros can let write type hinting without the users being noticed and as the computation is done at compile time, they allow optimization of operations or functions which does not depend on user input.
-   Macro can build apis that say what they mean. It allows to avoid unnecessary intermediary steps for the users to know, especially ones that require forms that are not essentials to the API. For example, building resources or calling functions. In this case, we should try to have as much operations in functions, to avoid bugs but also to offer the choice to the user to call functions (which are values) or macros.
-   As macro execute the logic of its body before executing its arguments, we can bend the control flow of our code. The lowest level of looping in Clojure is the `loop/recur` construction and most control flow in Clojure are derived from this. This is a special case of creating languages features.


## Links

-   [Mastering Clojure Macros](https://pragprog.com/book/cjclojure/mastering-clojure-macros)

-   **tags:** [clj](../decks/clojure.md)


## See also (generated)

-   <../decks/clojure.md>
-   <20200430141226-life_in_dynamic_typing.md>
-   <20200430141609-david_nolen.md>
-   <20200430154352-cli_arguments.md>
-   <20200430154528-multiple_environment.md>
-   <20200430155637-applied_clojure.md>
-   <20200430155819-core_async.md>
-   <20200430160432-clojure_for_the_brave_and_the_true.md>
-   <20200430235013-specs.md>
-   <20200502122138-simple_made_easy.md>
-   <20200503222619-org_roam_clj.md>
-   <20200504204808-why_clojure.md>
-   <20200504212017-edn_and_transit.md>
-   <20200505112138-clojure_reducers.md>
