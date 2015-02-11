#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

(git subtree split --prefix public -b gh-pages)
(git push -f origin gh-pages:gh-pages)
(git branch -D gh-pages)

# Push source and build repos.
git push origin master
git subtree push --prefix=public git@github.com:enja/quote.git gh-pages