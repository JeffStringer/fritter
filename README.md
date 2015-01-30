#Fritter

##What to Expect

Fritter mimics the basic functionality of Twitter. Upon signing up, users receive a confirmation email. Similar to Twitter, users can post "freets", follower other users and see their freets.

##Yeah, but what's under the hood?

Thanks for asking! Fritter is an Angular on Rails app, which means I constructed an API using Ruby on Rails and AngularJS consumes the API. I used Bower to handle front-end dependencies which includes AngularJS, Moment.js to convert time to a readable format from JavaScript, and AngularDevise for user authentication. I used the Mailchimp API for user signup confirmation emails.


##Setup
In your terminal, clone this repo:

```console
$ git clone git@github.com:JeffStringer/fritter.git
```

Make sure you've installed [postgres](http://www.postgresql.org/download/) and have started the server:

```console
$ postgres
```

Install all the dependencies:

```console
$ bundle install
$ bower install
```

Set up the databases on your local machine:

```console
$ rake db:create
$ rake db:schema:load
```

Finally, start the rails server:

```console
$ rails s
```
It should now be available at `localhost:3000`


##Author
[Jeff Stringer](http://jeffstringer.gi)

##License
MIT