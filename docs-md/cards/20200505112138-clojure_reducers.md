# Clojure Reducers

## Concepts

  - Concurrency  
    the concept of handling multiple tasks at the same time.
  - Parallelism  
    the concept of performing multiple computations at the same time.

The difference lies in the fact that in concurrency there is a sense of
competition of resources (who/what gets to use the memory or cpu) for
completing the tasks, in contrast to parallelism which requires
coordination and collaboration to achieve its goal.

### Sources

  - [How to Think about Parallel Programming:
    Not\!](https://github.com/matthiasn/talk-transcripts/blob/master/Steele_Guy/ParallelProg.md),
    Guy Steele.

## Reducers

The things that can be improved is usually latency and resources usages.
Scan operation can be parallelized. The goal is to amortizing the
overhead for launching parallel computation.

  - Work-span  
    Compare the unit time cost of your program against what is the
    minimal sequential path of unit of work on a machine with infinite
    core, when the cost is one, the term is embarrassingly parallel
    problems. Observer that the amount of work increased with parallel
    work than in a serial version.
  - Tiling  
    gathering many of the small problem, and compute the function on
    each group/tile.
  - Parallel stack  
    ability to steal work from other tiles to increase speed.
  - Fusion  
    is to join the operations to remove communication (similar to
    transducers to sequences operations).
  - Fork/join  
    split the work, until a base case, make the computation the segment
    and combine the blocks back.

### Sources

  - <https://www.braveclojure.com/quests/reducers/intro/>
  - [Parallel Programming, Fork Join, and Reducers - Daniel
    Higginbotham](https://www.youtube.com/watch?v=eRq5UBx6cbA)

## Reducers A Library and Model for Collection Proc - Rich Hickey \[2012\]

### Summary

The model of map/reduce is revisited to reduce/combine. The `reduce`
function is replaced by the `r/fold` function. The main idea is to
express map, filter and other operations on sequences as reducing
functions. See transducers for more details on this.

The advantage of this the reducers are not tied to the input nor order
anymore. The `r/fold` function takes additionally to `reduce` a minimal
size, a combining function and a reducing function. The `r/fold`
function will fork the process and segments the collection until a
certain size is reached. Note that `fold` does not have a single initial
value. But the seeds (the initial value for each segment) is provided by
the call to the combining function without any argument which should
return a identity value (which is 0 for `+`, 1 for `*`, empty collection
for the collection). The benefit is that you can provide mutable object
for performance at the segment level, otherwise you will have trouble.

The reducing function is then applied and then combined by the combing
function (which could be the same as the reducer). At the bottom is of
the processing, `reduce` will be called and so we don't need to have
empty collection. **A combining function is a monoid (a binary function
with an** **identity value)**.

Although really similar to transducer, the advantage of reducers over
transducers is still the ability to use `r/fold`. In the future,
transducers might be replace the reducers in the parallel mode as well.

The talk gives the example of a apple pie maker with an assistant with
the operation remove stick (`r/map`) and keep only the healthy ones
(`r/filter`).

### Sources

  - [Talks from Rich
    Hickey](https://www.youtube.com/watch?v=IjB-IOwGrGE)
  - [Transcripts](https://github.com/matthiasn/talk-transcripts/blob/master/Hickey_Rich/Reducers.md)

## Links

  - [Clojure for the brave and the
    true](./20200430160432-clojure_for_the_brave_and_the_true.md)
  - [Applied Clojure](./20200430155637-applied_clojure.md)

## See also (generated)

  - [Applied Clojure](./20200430155637-applied_clojure.md)
  - [Clojure](./../decks/clojure.md)
  - [Clojure for the brave and the
    true](./20200430160432-clojure_for_the_brave_and_the_true.md)
  - [core.async](./20200430155819-core_async.md)
