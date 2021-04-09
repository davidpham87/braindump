# Why?

  - Using [org-roam](https://github.com/jethrokuan/org-roam),
    [mkdocs-material](https://squidfunk.github.io/mkdocs-material/), I
    can generate a website to search for my idea, using the zettelkasten
    methods.
  - Org mode is great for authoring, but I do prefer some nice font and
    a good navigation, search navigation. mkdocs-material offered a
    great compromise and orgmk allowed me to have a command line
    conversion.
  - [Clojure](./decks/clojure.md) allowed to handle all the files
    systems, interaction with the sqlite database, the parsing and the
    concurrency.
  - I came up with my own set up, cards for writing anything that goes
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

  - [clj](./decks/clojure.md),
    [core.async](./cards/20200430155819-core_async.md).

## See also (generated)

  - [First blog ticket](./blog/20200502171331-first_blog_ticket.md)
