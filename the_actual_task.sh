#!/bin/bash
# Before running this script you need to run the following 
#  commands in this directory
#
# git clone git@github.com:SemanticUIBot/cdnjs.git
# git clone https://github.com/jlukic/Semantic-UI.git

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update our Semantic-UI clone and find the most recent tag
cd "$DIR/Semantic-UI"
git pull
tag=$(git tag -l | node ../get_tag.js)
echo $tag

# Now go to our CDNJS fork
cd "$DIR/cdnjs"

# update everything to the latest
git checkout . || false
git checkout master || false
git pull https://github.com/cdnjs/cdnjs.git master || false

# Check if a branch matching our tag exists; if it does then we want to
# exit this because we've already set up the pull request
git branch --list | grep $tag && exit 1

# Checkout a new branch for the version
branch=semantic-${tag}
git checkout -b $branch

# copy all of the files over
cp -R "$DIR/Semantic-UI/build/packaged" "$DIR/cdnjs/ajax/libs/semantic-ui/${tag}"

cat > "$DIR/cdnjs/ajax/libs/semantic-ui/package.json" <<EOF
{
    "name": "semantic-ui",
    "filename": "javascript/semantic.min.js",
    "version": "${tag}",
    "description": "Semantic empowers designers and developers by creating a language for sharing UI",
    "homepage": "http://semantic-ui.com/",
    "keywords": [
       "semantic",
       "ui"
   ],
   "repositories": [
       {
           "type": "git",
           "url": "https://github.com/jlukic/Semantic-UI"
       }
   ]
}
EOF

# make a commit for it
git add "$DIR/cdnjs/ajax/libs/semantic-ui/${tag}"
git commit -am "updated semantic-ui to ${tag} by bot"
git push origin $branch

cat > /tmp/sempull.md << EOF
Update Semantic-UI to ${tag} (from: bot)

This is an automated pull request by a bot.  It checks to see if Semantic-UI
has any new tags, and if it does, it prepares and sends a pull request.

If you have any issues with the bot please contact f.bagnardi@gmail.com 
[(@brigand)](https://github.com/brigand/), or [github support](https://github.com/contact) 
(if it's urgent).  GitHub has my full permission to disable the bot's account for any reason.

I don't forsee an issue with it, but code is known to be bug prone :-)
EOF



hub pull-request -b cdnjs:master -h SemanticUIBot:${branch} -F /tmp/sempull.md
rm /tmp/sempull.md




