# Clojure Functional Programming Principles

The two foundational core idea of Clojure are pure functions and
immutable data structure.

## Pure and first class functions

Pure functions are functions without side effects and return the same
result when given the same input, at any time and any circumstance.

Side effect free means that the function will not cause any logical
change to the state of the program or the world (the program will
consume energy).

The second property (returns the same output if the function is given
the same input) means a pure function internals can only depends its
inputs and external information that is constant (e.g. global constant
values).

This does not prevent the function to use mutable data structure as long
as they are internal and does not affect the outside world nor the
consumer. A common pattern is to create a mutable variant of a data
structure (via `transient!`) at the start of the function call and
return a **immutable** (via `persistent!`).

First class functions means functions are can accept functions in their
inputs and hence are a value.

## Immutability

Immutability is the default idiom. Immutability means that logically a
variable can only be replaced and never modified. It is best understood
with a comparison with python (where the default idiom is to have
mutable data structure).

``` python
d = {"a": 3}
f(d) # some hypothetical function f
```

``` clojure
(def d {:a 3})
(f d) ;; some hypothetical function f
;; what is d?
```

In python, you can not know the value of `d`, as the function `f` might
change its content and has repercussion on the global `d`. Whereas in
the Clojure, `d` kept its original value `{:a 3}`.

This allows to dramatically simplify the task of reasoning about code
behavior, especially in concurrent environment where operations are non
deterministic. Immutability is achieved through persistent data
structure which efficiently models the replacement of variables.

Obviously, other languages can emulate the behavior, but the difference
it is not the default idiom and hence require conventions and focus to
not fall in the pitfall of mutability.

## Dynamic emphasis, data and values

We code in data and values, that is generic types are left as is and no
artificial types is generally not enforced. There are only few generic
types and values:

Atomic  
`nil`, booleans, integers, floats, string, characters, dates, keywords,
symbols (maybe a few other)

Composite  
vectors, maps, sets, list, sorted-map.

We respect this fact and try to code as much as possible with values.

The language is dynamic, hence it handles heterogeneous collections and
return types and polymorphism.

## Links

-   [Clojure rationale](https://clojure.org/about/rationale)
-   [edn](https://github.com/edn-format/edn)
-   [transit](https://blog.cognitect.com/blog/2014/7/22/transit)

## See also (generated)

-   [Clojure](./../decks/clojure.md)
-   [shadow-cljs](./20200430154647-shadow_cljs.md)
