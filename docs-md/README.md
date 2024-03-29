# Why?

-   Using [org-roam](https://github.com/jethrokuan/org-roam),
    [mkdocs-material](https://squidfunk.github.io/mkdocs-material/), I
    can generate a website to search for my idea, using the zettelkasten
    methods.
-   Org mode is great for authoring, but I do prefer some nice font and
    a good navigation, search navigation. mkdocs-material offered a
    great compromise and orgmk allowed me to have a command line
    conversion.
-   [Clojure](./id:9336fa0f-85f3-4943-b374-6ca2f01ee0f8) allowed to
    handle all the files systems, interaction with the sqlite database,
    the parsing and the concurrency.
-   I came up with my own set up, cards for writing anything that goes
    into my minds, links them and decks for writing summaries. Blog
    posts are a place where I can write some ideas and opinions to share
    them.

## Technical challenge

I created some functions to leverage the `org-roam.db` sqlite data base.
With my own starting template, the code reads the tags and the links,
such that automatic see also are created at the end of each page.

See org-roam-clj on how to use the library.

## Small index for quick access

### Programming

-   [clj](./id:9336fa0f-85f3-4943-b374-6ca2f01ee0f8),
    [core.async](./id:843bd7e1-7106-4c45-ba46-fd2691b349b6).

## See also (generated)

-   [org mode](./cards/20200430180442-org_mode.md)
-   [Readings](./cards/readings.md)
