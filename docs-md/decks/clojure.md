# Clojure


## General

-   [X] Check flycheck with clojure (if useful, use clj-kondo).


## Concepts

-   [ ] specs: write about the principal functions. Test and use generative testing with specs.
-   [ ] Create generators using asnyc and neanderthal.
-   [ ] transducers: use them more extensively.
-   [ ] core.async: find excuses to use them.
-   [ ] Integrant
-   [ ] aero/enviro [whatever works with cljs]
-   [ ] Datomic
-   [ ] Webworkers


## TODO Web Development with Clojure

A handler is a function that receive a request map (and response callaback and raise callback) and returns a response map or calls the reponse callback on the response map. A middleware is a function that whose first argument is a handler and should return a handler.


## Clojurescript

-   [X] <https://github.com/bhauman/lein-figwheel> [shadow-cljs is more useful]
-   [ ] tools.deps, read more about arguments.
-   [X] Understand how to wrap javascript code into Clojure. Use NPM.
-   How to communicate between clojure and clojurescript (cljc) or sente.
-   [ ] <https://funcool.github.io/clojurescript-unraveled/>
-   [ ] Make a summary of core.async chapter. Udemy [core.async]


## Elements of Clojure


## Naming

There is a difference between the **sign** (the symbols or letters) and the **referent** (the thing/value to which the sign refers).

**Consistency** is one of the feature that allow to grow. Precision is a trade-off with generality. **synthetic** allow precision, **natural** allows beginners to understand (trade off wit how much to learn before being productive).


## Idioms


## Indirection

Indirection is the process of separating the *how* from the *what*. It useful when answering the question *How does it work* is answered best with *it depends*.

**Reference** and **conditionals** are two tools to perform indirection. Getting the referent from a reference is called **dereferencing**. Reference are open, while conditional are closed (which could be a feature). Another difference is the *order* matters in conditional (like `cond`).

Dispatch happens in two context runtime (**dynamic**) and compile time (**static** dispatching). Best to avoid hierarchies.

Abstraction should be simplest model that satisfies the context requirements and self consistent. It depends on the context which sets the minimal set of constraints to pay attention to. As such it lives in a bubble/context. Hence, we should ask, what are the assumptions of the code?

There are the two distinction for abstraction Principled vs Adaptable. Principled allows to create big architecture artifacts, but they are not adaptable (castle cards or sky scrapper, changing a room are hard). We should thrive for complex adaptable network, that is small components that are principled but in an adaptable network (pieces can be removed and substituted).

How to gather code to create principled component? If code have the same set of assumption, then good place to gather them.

Change is constant.


## Blogs


## Agile is an attitude - Russ Olsen [Cognitect](http://blog.cognitect.com/blog/2017/7/27/how-we-work-agile-is-an-attitude) [2017]

The Monkey wrench of agile is the following:

> *To get the job done you need to focus on the goal and the people who will get you there.*

-   There is no magic recipe, no set of practices that will guarantee success

> You need to be ready to throw away the rule book and bob and weave and flex with whatever comes next. You need to improvise, adapt and overcome.
> 
> Above all, agile means keeping your eye on the fundamentals:
> 
> *What are the goals? And how are we going to get there?*
> 
> You need to be ready to throw away the rule book and bob and weave and flex with whatever comes next. *You need to improvise, adapt and overcome*. Above all, agile means keeping your eye on the fundamentals: *What are the goals? And how are we going to get there?*.

You need to improvise, adapt and overcome. What are the goals, and how are we going to get there? When agile processes make sense, use them. When they don&rsquo;t, let them go without regret.


## Iteration Zero - Naoko Higashide [Cognitect](http://blog.cognitect.com/blog/2017/3/20/how-we-work-iteration-zero) [2017]

The framework is about people first, conversations, realizations, and shared understanding.

-   Bring people who will participate (not attend).
-   First is to define responsibilities.
    
    > <Who> will <Do> <What> for <Whom>.

-   Finishing lines.
    
    > The project will be complete when&#x2026;

-   Winning condition. Of the following choose three and describe:
    -   Schedule
    -   Scope
    -   Quality
    -   Budget
    -   Customer Satisfaction
    -   Teamwork / Learning

Make sure that project&rsquo;s sponsor is aligned with those of the team.


## Talks


### Maybe not - Rich Hickey [2018]

The talk is about `clojure.spec` and about the optionality in requirements.

Static typing proponents will always talks about the benefits of types without ever mentioning the costs.

In non breaking changes of API (requiring less, providing more), static typing will break APIs callers.

Records in contrast to maps (open sets of keys and values) are PLOP. Because you need to place something in the slot where they contain data, and hence options. Clojure will always forbid to create brittle system with closed specifications.

In Clojure, when an field of information (the value of a key in map) in unknown, the key is removed from the map (and avoid keys with `nil` value). Because if the value is `nil`, we don&rsquo;t know if we should be worried if the value is `nil` or if it is valid. In contrast, if the key is not in the map we can safely ignore it.

Data aggregates are herd of information and is moving from one process to another.

The solution is to define herd is to split the specifications into two: a schema describing the aggregate (and its tree) and a context whenever in function calls and returns.


## Specs Leverage/Testing/Custom Generators, Screencast- Stuart Halloway [2016]

The advantage are validation, conformance, destructuring, error message, composition, example data generation, assertion, documentation, generative testing, instrumentation.

It is about specs. Specs allows to define attributes, composites and function specs. A function specs takes three keys `:args`, `:ret` and `:fn` (which takes the specs as argument). The most interesting is the `fn` which is describe properties of the function returns. Specs allows to use regular expression on data structure for creating your specs. You can use `s/exercise` for generating sample of your spec and ``(test/check `my-fn)`` and `test/summarize-result` for checking your function specs. The function `s/valid?` and `s/explain-data` allows to validate and to get data for our mistakes.

Whenever testing, you also can use `test/instrument` to instrument your function for better error message.

`s/alt` for alternative, `s/and` for predicates aggregation, `s/or` for *or* predicate composition. Maybe `s/&`.

The function `gen/fmap` takes a value from a generate and returns a value, while `gen/let` and `gen/bind` takes a generator and return a generator. Usually these are wrapped into functions and called with

```clojure
(s/exercise ::s {::s wrapper-around-fmap})
;; or
(s/def ::s (s/spec pred? :gen wrapper-around-fmap))
```

Usually, `gen/let` and `gen/bind` are used in conjunction with a *model* for representing the input data. The model acts as generator of test input, helping to conceptualize the expected inputs. For example

```clojure
(def model (s/cat :prefix string? :match string? :suffix string?))
```

when testing a `index-of` function for string.

Write about `s/fspec`. The trick in using `s/fspec` is to provide reasonable generators. Using the `gen/return` allows to wrap a high order function as a *generator*. Read `test.check.generator` for more [details](https://github.com/clojure/test.check/blob/master/doc/generator-examples.md).


### Design, Composition and Performance [2013]

-   [Design](../cards/20200430190921-design.md) card.


## See also (generated)

-   <../cards/20200430141226-life_in_dynamic_typing.md>
-   <../cards/20200430141609-david_nolen.md>
-   <../cards/20200430154352-cli_arguments.md>
-   <../cards/20200430154528-multiple_environment.md>
-   <../cards/20200430154647-shadow_cljs.md>
-   <../cards/20200430155438-mastering_clojure_macro.md>
-   <../cards/20200430155637-applied_clojure.md>
-   <../cards/20200430155819-core_async.md>
-   <../cards/20200430160432-clojure_for_the_brave_and_the_true.md>
-   <../cards/20200430190921-design.md>
-   <../cards/20200430235013-specs.md>
-   <../cards/20200501201607-quotes.md>
-   <../cards/20200502122138-simple_made_easy.md>
-   <../cards/20200503222619-org_roam_clj.md>
-   <../cards/20200504204808-why_clojure.md>
-   <../cards/20200504212017-edn_and_transit.md>
-   <../cards/20200505112138-clojure_reducers.md>
-   <../cards/20200505113402-high_performance_clojurescript.md>
-   <../cards/20200505124708-potemkin.md>
-   <../cards/20200505124946-clj_toolkit.md>
-   <../cards/20200517205339-clojure_zippers.md>
-   <../cards/20200521232124-cljss.md>
-   <../cards/20200524185034-clojure_functional_programming_principles.md>
-   <../README.md>
