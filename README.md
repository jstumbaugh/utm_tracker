# Tracker

This is a testing app for tracking page views with UTM parameters. Given any
page that has the javascript to send the parameters, this app records that page
view with its UTM parameters and associated information.

There is a rails application for testing purposes in the `spec/testing_app`
directory. To test recording page views, start the server for the tracker with
`bundle exec rails server` and start the testing app server with `bundle exec
rails server --port 3001`. You can now visit
[http://localhost:3001/](http://localhost:3001/) and see the tracker in action.
