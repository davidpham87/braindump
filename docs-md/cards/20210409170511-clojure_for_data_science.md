# Clojure Data Science

This is a quick overview of a few concepts required to understand the
clojure data science ecosystem. The goal is to provide little guidance
on how to navigate the tools and how search in the API and documentation
efficiently.

## Low Level Memory Layout ([dtype-next](https://github.com/cnuernber/dtype-next))

This library is responsible for the low level memory layout for numerics
and the bridge between multiple language. Think of it as you basic
construction block to exchange between numpy, neandhertal or even julia.
This library works as interop between JVM and C. See
[this](https://techascent.com/blog/next-gen-native.html) . The
importance of this library is the exchange between representation comes
at very little costs as they mostly share the memory layout.

## Tensors ([dtype-next](https://github.com/cnuernber/dtype-next))

Tensors are generalization of matrices as they have more than two
dimensions. In clojure, the `tech.v3.tensor` namespace is similar to
`numpy` (modulo a few missing).

## Datasets ([tech.ml.dataset](https://github.com/techascent/tech.ml.dataset))

The datasets are data structures then can be understood as dictionaries
where all values have the same one dimension length. The layout is
optimized for making operations.

The `tech.v3.dataset` is the main namespace with the core api function.
The [tablecloth](https://github.com/scicloj/tablecloth) is library built
to provide a higher level API on the datasets and is probably the entry
point for performing most data science tasks.

The `tech.v3.dataset.tensor` are the namespace to convert the data
between format.

### Trick

Usually, whenever using java interop, one has to transform the tensor
into an low level `array`. Search for `->array` function in tablecloth
or in `tech.v3.dataset`.

## Machine Learning ([tech.ml](https://github.com/techascent/tech.ml))

In combination of `tech.ml.datasets`, this library allows to leverage on
the `smile` java package to perform machine learning, and `xgboost` as
well.

## Python ([libpython-clj](https://github.com/clj-python/libpython-clj))

### Trick

For [embedded](https://clj-python.github.io/libpython-clj/embedded.html)
version, there might be some additional installation step in modern
python

``` shell
sudo pip3 install javabridge numpy --no-cache-dir --no-binary :all: --no-build-isolation
```

This allows to start your repl with an aliases

``` python
import cljbridge
cljbridge.init_clojure_repl(classpath_args=["-A:clj"])
```

## R ([clojisr](https://github.com/scicloj/clojisr))

There is a package for interacting with R and Renjin. There are bindings
for working with GraalVM FastR as well. At this point in time, the
interaction with R is not perfect.

## Julia ([libjulia-clj](https://github.com/cnuernber/libjulia-clj))

There are bindings to julia as well, but it does not seem developped.

## [Uncomplicate](https://uncomplicate.org/) Suite (neanderthal, ClojureCuda, ClojureCL)

These are quite developped library by Dragan Djuric.

The `neanderthal` library aims to replace `numpy`, whereas ClojureCuda
and ClojureCL aims to ease developpement of Cuda C and OpenCL programs
with clojure interactivity. The [Deep
Diamond](https://github.com/uncomplicate/deep-diamond) create the
bindings to intel and cuda deep neural networks libraries for Clojure.

The building block is `neanderthal` and hence interop with
`tech.ml.dataset` is welcome.

## Links

-   [dtype-next](https://github.com/cnuernber/dtype-next),
    [tech.ml.dataset](https://github.com/techascent/tech.ml.dataset),
    [tech.ml](https://github.com/techascent/tech.ml)
-   <https://techascent.com/blog/next-gen-native.html>
-   <https://github.com/gigasquid/libpython-clj-examplesk>

## See also (generated)

-   [Clojure](./../decks/clojure.md)
-   [Python](./python.md)
