#!/bin/bash

green="\033[01;32m"
nocol="\033[0m"

if [ -z "$*" ]; then
	echo $'Option  Meaning\n-am     Patch using `git am`\n-ap     Patch using `git apply`\n-r      Revert patches'
	exit 0
fi

if [ "$(basename "$PWD")" = extra ]; then
	cd ../..
	ROOT="$PWD"
else
	ROOT="$PWD"

fi

find vendor/extra/patches -name "0001*.patch" -printf '%P\n' | sed 's,/[^/]*$,,' | while IFS= read -r repository; do

	LAST_COMMIT_HASH="$ROOT/${repository//\//_}.log"
	PATCHES="$ROOT/vendor/extra/patches/$repository"

	cd "$ROOT/$repository" || exit
	echo -e "${green}Patching $repository ...${nocol}"

	case $1 in
	-am)
		git rev-parse --short HEAD >"$LAST_COMMIT_HASH"
		git am --abort 2>/dev/null
		git am --keep-cr -3 "$PATCHES"/*
		;;
	-ap)
		git apply -v "$PATCHES"/*
		;;
	-ch)
		git apply -v --check "$PATCHES"/*
		;;
	-r)
		if [ -e "$LAST_COMMIT_HASH" ]; then
			git reset --hard "$(cat "$LAST_COMMIT_HASH")"
			rm "$LAST_COMMIT_HASH"
		else
			git reset --hard && git clean -df
		fi
		;;
	esac
	cd "$ROOT" || exit

done
