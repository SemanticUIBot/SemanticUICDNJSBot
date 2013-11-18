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


## MIT License

The MIT License (MIT)

Copyright (c) 2013 Frankie Bagnardi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
