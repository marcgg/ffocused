[![Build Status](https://secure.travis-ci.org/marcgg/ffocused.png)](http://travis-ci.org/marcgg/ffocused)

# ffocused
A service to showcase your pictures online.

We believe that a portfolio should display only your most stunning work, 
with no clutter & in a layout designed for your photos.

See http://ffocused.com for more about what this is all about.

## Examples Portfolios

 - http://ffocused.com/marcgg
 - http://ffocused.com/gflandre

## Services Supported
Currently ffocused supports:

 - Flickr (Pictures by set, maximum 100 public pictures per category)
 - Instagram (Pictures by user, requires login)
 - Facebook (Pictures by user, requires login)

Planned:

 - Picasa (Google+)
 - Tumblr
 - Dropbox

## Configuration
### To run ffocused localy and for development purposes
Clone this repository or fork it:

    git clone https://marcgg@github.com/marcgg/ffocused.git

From the project root run:

    cp config/social_accounts.yml.template config/social_accounts.yml

This will create the social_accounts.yml file, that looks like this:

    development: &DEVELOPMENT
      flickr:
        application_api_key: "xxx"
        application_secret: "xxx"
      facebook:
        application_id: "xxx"
        application_secret: "xxx"
        application_api_key: "xxx"
        callback_url: "http://xxx.com/oauth/facebook_callback"
      instagram:
        client_id: "xxx"
        client_secret: "xxx"
        callback_url: "http://xxx.com/oauth/instagram_callback"

    test:
      <<: *DEVELOPMENT

Notice that you will have to create applications of your own and then
report the configuration options here. More about each service here:

 - Flickr: http://www.flickr.com/services/developer
 - Facebook: http://developers.facebook.com
 - Instagram: http://instagram.com/developer/

### Deploy on Heroku
ffocused.com is deployed on Heroku. It is a great service and if you
don't know it I recommand that you go and check it out. The thing with
Heroku is that you have a different way to setup configuration
variables since you don't want to commit your social_accounts.yml file
for obvious security reasons.

So what do we do? Well we use ENV variables! More about that here: http://devcenter.heroku.com/articles/config-vars

Because I'm lazy, I added a simple rake task that takes the current
environment loaded and gives you the command to run and set the
variables on Heroku. Simply run:

    rake ffocused:heroku_vars

Copy the result that should look like something like:

    heroku config:add [blah blah blah lots of stuff here]

Then you need to say that you wan to use Heroku by setting a variable in
00_configure.rb:

    USE_HEROKU = true

Note: This will most likely change since I'm not convinced by this
approach.

And that's it! Well of course you have to setup Heroku, but that's
another story documented here: http://devcenter.heroku.com/articles/quickstart

## Tests
Tests are made with rspec2. There isn't enough tests yet, we are working on it.

Any pull request needs to have its set of tests to be accepted (except
for themes). I know right, do what I say and not what I do... It'll get
fixed, tests are coming, I promise.

### Spork

You can use spork to run the test suite:

    bundle exec spork

... to start the drb server and then:

    bundle exec rspec spec --drb

## Compatibility
ffocused runs on Ruby 1.9.2 and 1.8.7, but the support for 1.8.7 will be
soon dropped.

ffocused aims to be compatible with recent browsers, meaning Firefox,
Safari, Chrome and IE8+. Creators of new themes should take this into consideration.
