# Multiple environments

-   We can have different class paths for configuration with `clj` and
    alias in `deps.edn` to manage them.
-   Proxies: you add in \~.shadow-cljs/config.edn or in the config file

``` clojure
{:maven {:proxy {:host "proxy.host.com" :port 8080}}}
```

tags  
[clj](./id:9336fa0f-85f3-4943-b374-6ca2f01ee0f8) build
