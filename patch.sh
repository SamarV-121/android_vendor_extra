#!/bin/bash

ROOT="$PWD"

for repository in $(find vendor/extra/patches -mindepth 2 -type d | sed 's|.*patches/||')
do
    cd "$ROOT/$repository"

    git am --keep-cr "$ROOT/vendor/extra/patches/$repository"/*

    cd "$ROOT"
done
