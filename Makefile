.PHONY: plugins update-plugins sync-plugins clean-plugins

plugins: sync-plugins clean-plugins

sync-plugins:
	git submodule update -j 8 --init

update-plugins:
	git submodule update -j 8 --remote --init

clean-plugins:
	git clean -dffx plugins
