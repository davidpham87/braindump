# ClojureCLR

## Installing dotnet on ubuntu

Avoid using the snap, use the binarie, because the snap has some issue
with require sudo rights to run.

## Starting a socket server

Installing ClojureCLR for the whole system under
`~/.dotnet/tools/Clojure.Main`

``` shell
dotnet tool install --global Clojure.Main
```

You can write this file under your bin file (expand `~` to your `$HOME`)
to launch a socket repl on port 7777

``` shell
~/.dotnet/tools/Clojure.Main -e "(clojure.core.server/start-server {:name (str 'clr-repl) :port 7777 :accept 'clojure.core.server/repl}) @(promise)"
```

### Dependencies

You have to set the `CLOJURE_LOAD_PATH` environment variable with the
root path of your dependencies (basically it replace your classpath).
The exact value depends on OS.

## See also (generated)

-   
