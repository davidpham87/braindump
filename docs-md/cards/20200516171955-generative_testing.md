# Generative Testing


## Properties

Taking from [Applied Clojure](20200430155637-applied_clojure.md)

> We are looking for *invariants* &#x2013; properties that are always true. [&#x2026;] mathematical laws, relationships between inputs and outputs, round-trip or complementing functions, and comparing action effects.
> 
> Properties like identity, associativity, commutativity and idempotency are an excellent place to start.

Other general properties:

-   membership is not modified (frequencies of element still are the same), maybe distinct for sets and hash-map.
-   Trusted implementation. Compare the results and calculation on a trusted different implementation (different language, slower/faster version). For stateful components (like database), apply same logical operation on a logical model correct implementation like hash-map or vectors (e.g. `create` is `assoc`, `delete` is `dissoc`).
-   Avoid to implement again the same algorithms.
-   Commutativity of operations


## How to specify it

Talk about how to specify properties for pure functions.

-   **Invariant:** things that ought to be always true.
-   Optimize for correctness in the assertion, not for performance (test case are usually small).
-   Make sure that generator are also valid.

-   **Postcondition:** Asking what is the postcondition? Finding what ought to be true after the function call.
-   If the properties requires to have the function under test, create a generator that insures that the state is consistent (for example, in a hash-map, for testing `contains?`, you can insert and remove key to test the properties of `contains?`).

-   **Metamorphic properties:** instead of predicting and test the result from an input, predict and test the relationship of result from two almost input. It is the idea of paths for getting to a final state. The relationship could be equality, size comparison. You can also check equivalence on result (as function of the result). You have to change in terms of the space of continuous functions: if input change, how will the change on the image be \(\Delta f = f(x+\delta) - f(x)\)? Some write metamorphic relations.

-   **Inductive properties:** argument by induction that only the correct function can pass the test (using recursion). Double check the conformity by applying operations that should also keep the result valid.

-   **Model-based properties:** similar to trusted implementation by working on a abstraction function with an abstraction operation. The assumption is you can convert your result into the abstraction and applying the same operations on the abstraction (you have an [homomorphism](https://en.wikipedia.org/wiki/Homomorphism)).

Model-based properties is one of the most powerful representation. However, the model based properties can look too alike than the implementation or the function under test. If you feel you write too much code on the model based version, switch to metamorphic properties do not require on a model (and they are easier to write with good effectiveness). Invariant properties should be first because they are the most fundamental.


### Source

[How to specify it?](https://www.tfp2019.org/resources/tfp2019-how-to-specify-it.pdf), [video](https://www.youtube.com/watch?v=G0NUOst-53U) (jump until minute 10 for start of content).


## Links

-   <https://fsharpforfunandprofit.com/posts/property-based-testing-2/>
-   [How to specify it?](https://www.tfp2019.org/resources/tfp2019-how-to-specify-it.pdf), [video](https://www.youtube.com/watch?v=G0NUOst-53U) (jump until minute 10 for start of content).
-   [How to write test and stay sane?](https://www.youtube.com/watch?v=zi0rHwfiX1Q)


## See also (generated)

-   [(](20200430235013-specs.md)
