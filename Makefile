ITEMS   := shared/rules shared/html shared/data public shared/img shared/js

release: npm grunt tosdr moveout

dev: grunt moveout

npm:
	npm install --tldjs-update-rules

grunt:
	grunt build --browser=$(browser)

tosdr:
	grunt execute:tosdr --browser=$(browser)

moveout: $(ITEMS)
	rm -rf browsers/$(browser)
	mkdir browsers/$(browser)
	cp -r $(ITEMS) browsers/$(browser)
	find ./browsers/$(browser)/js -type f -name '*.es6.js' -delete
	rm -rf ./browsers/$(browser)/js/ui
