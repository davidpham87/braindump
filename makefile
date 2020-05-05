.PHONY: http
http:
	cd docs && python3 -m http.server 8000

.PHONY: tags
tags:
	clojure -Adev -t create-tags

.PHONY: docs
docs: tags
	clojure -Adev -t markdown

.PHONY: docs-only
docs-only:
	clojure -Adev -t markdown
