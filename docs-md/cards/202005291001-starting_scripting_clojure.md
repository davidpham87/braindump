# Starting Scripting Clojure

How to enjoy scripting in Clojure? I am describing my small Clojure
setup to let me experiment with the language and solve many of my tasks.

I am trying to explain how you could (and understand how to) start a
REPL Driven Development in most folder location with low ceremony and
with your (hopefully) favorite text editor

## What is the problem?

Setting the environment in Clojure is notoriously hard. When I started
learning Clojure, we had to use leinigen, set the `project.clj` file
with all the java/clojure options (I honestly still don't know them
since I am using `deps.edn` now).

My annoyance was for many of my tasks, I just wanted to launch a REPL in
a given folder, create a new `.clj` file, build a connection between the
REPL and my text editor (Emacs obviously), and start to code and send
forms to the REPL (REPL driven development).

When do this occasions arise? Usually, you just want to rename files in
your tree, to work on some of your colleagues inputs and use Clojure for
making the data transformation, or to create some command line scripts,
or to solve online problems for training your Clojure skills.

Why does it matter? I used R and python previously. In both languages, I
really appreciated the ability to just create a `.r` or `.py` file, open
a REPL from Emacs and start to code interactively. It felt easy and
lowered my cognitive load to experiment with the languages and learn
them.

I think my appreciation of Clojure changed the day I managed to get the
same workflow working in many context and it might help many.

## Goals

  - Ability to start scripting and a repl with your text editor in any
    folder with low ceremony.
  - Quick start of scripts in Clojure which can be converted into bigger
    project.

## Too long don't read

First, insure your text editor support `nrepl` (emacs, vim, IntelliJ, VS
Code and Atom support it) and download the required package to support
your Clojure development.

Then, two solutions

1.  Install clojure, and then for a

<!-- end list -->

``` bash
clojure
```

1.  For super fast startup and for shell scripting you can install
    babashka. Then start the repl with

<!-- end list -->

``` bash
bb --nrepl-server 1667
```

## Setting up your machines

  - nrepl
  - Brew install clojure, download babhaska.

### Adding dependencies

You can add deps.

If you use babashka, it has its own methods for adding dependencies
(read here).

## Generality of the solution

So can we use the same process for *real* projects? Yes. Ironically, I
found my solution while working on big projects. How do you start a
bigger project? Create `deps.edn` in the root directory of your project,
create your `src` folder, add the `:paths` (usually `["src"]`) and
`:deps` and you can start organizing your code.

This workflow helped me tremendously when coding in ClojureScript. I use
`shadow-cljs` and the typical workflow is to start it on the command
line for compiling and watching change of your source code. I spent a
bit of time understanding how I could connect Emacs to the REPL (`M-x
cider-connect-cljs`) which was different than the typical
`cider-jack-in` function.

## ClojureScript, other targets and considerations

I describe my workflow for writing quick script with Clojure JVM.
Obviously, there are alternatives with other costs/benefits attributes.

  - lumo and plank for leveraging the node and the javascript
    environment.
  - joker, an Clojure implementation in Go.

That being said, I know many expert Clojurian have a single REPL process
running for weeks, hence the start of a REPL might not matter after some
level of expertise. I still like the ability to launch a REPL in any
folder, without thinking too much.

In some situation, `nrepl` might be a too high requirement for your
project (because the library does a lot under the hood). In this case,
look at the socket REPL (insert link). I don't have a lot of experience
with the socket REPL, except that emacs use the `inf-clojure` mode to
interact with it.

## Steps summary

  - Find a text editor/IDE that supports the `nrepl` (it should not be
    that hard).
  - Write a simple command line that can launch a `nrepl` server in the
    root directory where you want to work. It can be as easy as calling
    `bb
        --nrepl-server` or `clojure -A:nrepl` after defining the `:nrepl`
    alias in `.clojure/deps.edn`. Note the port or set it to a fix
    value.
  - Create a `.clj` (anywhere)
  - Connect your text editor to the REPL and start sending forms from
    your file.
  - Once you feel comfortable with this workflow, see how you can adapt
    it to other situations (e.g. ClojureScript, react native, server
    repl, server vm).

## Conclusion

The goal of the post is to give you a straightforward plan for kick
start repl driven development. You achieve this by having a compatible
editor, launching a `nrepl` server with `clojure` or `bb` , connecting
your editor to the REPL.

I hope this simple workflow will allow to experiment much more with
Clojure and have fun with it.

## See also (generated)

  - [Clojure](./../decks/clojure.md)
  - [Index](./../decks/index.md)
