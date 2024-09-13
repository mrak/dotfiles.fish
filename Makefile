.PHONY: update-plugins sync-plugins

sync-plugins:
	git submodule update -j 8 --init

update-plugins:
	git submodule update -j 8 --remote --init
