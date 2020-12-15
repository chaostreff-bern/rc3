#!/bin/bash

set -x

mkdir dist
tiled --export-map json bern.tmx dist/main.json
sed -i 's/..\\\///g' dist/main.json
find . -name \*.tsx -exec cp {} dist/ \;
cp tiles/Interiors_free_32x32.png dist/tilInteriors_free_32x32.png

git add dist && git commit -m "Update"
git push origin --delete gh-pages
git subtree push --prefix dist origin gh-pages
rm -rf dist
git reset --hard origin/main
