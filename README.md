SemanticUICDNJSBot
==================

this bot sends pull requests to cdnjs/cdnjs when a new Semantic-UI version is released

Sadly you can't really test any improvements to the bot, but I'll hapily test any pull requests.  

Of course, things like changes to the text in the pull request are welcome.

This bot is run with a cron task at 5:10pm PST

 - checks for new tags
 - makes a branch named semantic-TAG on the cdnjs repo
 - copies files to the CDNJS rep
 - updates package.json 
 - makes a comit
 - pushes to its repo
 - sends a pull request
 
And then we wait!
