# This respository serves two purposes #
* it has tests for admin_data
* it is the demo app that runs on [http://admin-data-test.heroku.com/admin_data](http://admin-data-test.heroku.com/admin_data)


# How do I run test?
* bundle install
* rake db:migrate
* rake db:test:prepare
* bundle exec cucumber

# How do I run demo application?
* bundle install
* rake db:migrate
* rake db:seed
* rails server
