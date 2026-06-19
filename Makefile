.PHONY: push pull

include .env

push: .rsync-exclude
	rsync -arvz --delete --exclude-from=./.rsync-exclude ./ $(DESTINATION_ROOT)

pull:
	rsync -arvz $(DESTINATION_ROOT)/ .

.env:
	echo 'Populate .env from .env-example'
	exit 1

.rsync-exclude: excluded .gitignore
	cat excluded .gitignore | sed 's/^/- /' > .rsync-exclude
