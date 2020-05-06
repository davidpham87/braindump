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


## See also (generated)

-   [Applied Clojure](20200430155637-applied_clojure.md)
-   [Clojure](../decks/clojure.md)
-   [Clojure for the brave and the true](20200430160432-clojure_for_the_brave_and_the_true.md)
-   [David Nolen](20200430141609-david_nolen.md)
-   [Mastering Clojure Macro](20200430155438-mastering_clojure_macro.md)
-   [shadow-cljs](20200430154647-shadow_cljs.md)
-   [specs](20200430235013-specs.md)
