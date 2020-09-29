.PHONY: http
http:
	cd docs && python3 -m http.server 8000 &
	firefox localhost:8000

.PHONY: tags
tags:
	clojure -A:dev -t create-tags

.PHONY: docs
docs: tags
	clojure -A:dev -t markdown

.PHONY: docs-only
docs-only:
	clojure -A:dev -t markdown
