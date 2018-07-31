#!/bin/bash

# Original from https://github.com/SangKa/react-in-patterns-cn/blob/master/publish.sh

rm -rf ./_book

gitbook build

mkdir ./_book/ebook
gitbook pdf ./ ./_book/ebook/react_patterns_ru.pdf
gitbook mobi ./ ./_book/ebook/react_patterns_ru.mobi
gitbook epub ./ ./_book/ebook/react_patterns_ru.epub

git checkout gh-pages
git pull origin gh-pages
cp -rf ./_book/* ./
git add .
git commit -m 'chore(docs): regenerated book'
git push origin gh-pages
git checkout master
