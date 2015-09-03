#_Missed Connections_

#### _It keeps track of search keywords and returns missed connection articles to a user, 9/3/2015_

#### By _Alyssa Horrocks, Austin Kincaid, Jessica Joly, & Jennifer Bell_

## Description

_Users can sign up with their name and e-mail. They can log into missed connections and create keywords to search missed connections. When the search is run, it will return useable links that match their user-specific keywords. Users can view the body text and visit the source material if desired. Ideally, it would run on a server constantly, update the list of connections, and notify the user when new connections appear based on their keywords._

_We based our scraping methods on the Viking Code School's tutorial here (#thanks): http://www.vikingcodeschool.com/posts/web-scraping-craigslist-with-rubys-mechanize-gem_

## Setup

_This application uses Ruby, Sinatra, Nokogiri gem, Bootstrap, and Mechanize gem._

* git clone https://github.com/ahorrocks2/missed_connections.git
* rake db:create
* rake db:schema:load
* rake db:test:prepare
* start Sinatra with ruby app.rb

*Enjoy!

### Legal


Copyright (c) 2015 **Alyssa Horrocks, Austin Kincaid, Jessica Joly, & Jennifer Bell**

This software is licensed under the MIT license.

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
