# Life In Dynamic Typing

-   **tags:** [Clojure](../decks/clojure.md)

In dynamic typed language, assertions are used often to check assumption of your input data. In Clojure the `:pre` and `:post` conditions can be used effectively to fill this purpose.

```clojure
(defn f [x]
  {:pre [(integer? x)]
   :post string?}
  (str x))
```

`{:elide-asserts true}` in production build compiler options to remove `:pre` and `:post` assertions in your code.


## Source

-   <http://swannodette.github.io/2015/01/09/life-with-dynamic-typing/>


## See also (generated)

-   <../decks/clojure.md>
-   <20200430141609-david_nolen.md>
-   <20200430154647-shadow_cljs.md>
-   <20200430155438-mastering_clojure_macro.md>
-   <20200430155637-applied_clojure.md>
-   <20200430160432-clojure_for_the_brave_and_the_true.md>
-   <20200430235013-specs.md>
