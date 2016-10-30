![Build Status](https://codeship.com/projects/17f0efc0-7606-0134-a20a-02a0cff8dcbf/status?branch=master)
![Code Climate](https://codeclimate.com/github/jsohpennstater/breakabletoy.png)
[![Coverage Status](https://coveralls.io/repos/github/jsohpennstater/breakabletoy/badge.svg?branch=master)](https://coveralls.io/github/jsohpennstater/breakabletoy?branch=master)

# PsychE
PsychE is an application that can be used as an initial screening tool for health professionals. It was built on Ruby on Rails with a Postgres backend, incorporated React, AJAX, Foundation on the front-end to manage rendering, and tested with RSpec and Capybara. Admins can create customized questionnaire sets and assign one questionnaire set to many different users which is done with a Rails backend. Scoring of the questionnaire is done through React which sends AJAX calls to the Rails backend to record and update user's answers.

The project uses the following components:

* Ruby on Rails
* CarrierWave/Fog
* React
* AJAX
* Javascript
* Foundation

## Demo
For a demo of the site, please visit our Heroku page here: [PsychE](http://psychelaunch.herokuapp.com/).


## Setup
The app uses Ruby 2.3.1 and was developed on Ruby on Rails 5.0.  React is served up
in Node.js using webpack 1.13.2.

To install, please run the following in your terminal:

### First, set up Rails
```
git clone https://github.com/jsohpennstater/breakabletoy.git
cd breakabletoy
bundle install
rake db:create
rake db:migrate
```

### Now set up webpack
`npm install`

To store image attachments, you will need to sign up for an Amazon Web Services.
Once you have your AWS secret keys, create a .env file in the root directory,
and add your AWS secret keys with the following format:

```
AWS_ACCESS_KEY_ID=<YOUR_ACCESS_KEY>
AWS_SECRET_ACCESS_KEY=<YOUR_SECRET_ACCESS_KEY>
S3_BUCKET=<YOUR_S3_BUCKET>
```

## Running the application
To run PsychE, please run the following commands in your terminal from the
`breakabletoy` directory:

```
rails s
npm start
```

Now open your browser and enter `localhost:3000` in your address bar.

## Testing
To run the test suite, please enter the following command from the `breakabletoy`
root directory:

`rspec`
