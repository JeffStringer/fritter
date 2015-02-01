#Fritter

##About

Fritter mimics the basic functionality of Twitter. Upon signing up, users receive a confirmation email. Similar to Twitter, users can post "freets" or messages, follower / unfollow other users and see their freets. Users receive email when they are being followed and when another user mentions them in a freet.

##So, what's under the hood?

Thanks for asking! Fritter is an Angular on Rails app, which means I constructed an API using Ruby on Rails which is consumed by AngularJS. I used Bower to handle front-end dependencies including AngularJS, Moment.js to convert time to a readable format from JavaScript, and AngularDevise for user authentication. I used the Mailchimp API for user signup confirmation emails.

##Author
[Jeff Stringer](http://jeffstringer.github.io)

##License
MIT