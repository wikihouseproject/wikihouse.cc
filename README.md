# [wikihouse.cc](https://wikihouse.cc)

[![Code Climate](https://codeclimate.com/github/wikihouseproject/wikihouse.cc/badges/gpa.svg)](https://codeclimate.com/github/wikihouseproject/wikihouse.cc) [![Issue Count](https://codeclimate.com/github/wikihouseproject/wikihouse.cc/badges/issue_count.svg)](https://codeclimate.com/github/wikihouseproject/wikihouse.cc/issues) [![Build Status](https://travis-ci.org/wikihouseproject/wikihouse.cc.png)](https://travis-ci.org/wikihouseproject/wikihouse.cc)

The official WikiHouse Foundation website.

[![WikiHouse Logo](public/apple-icon-120x120.png)](https://wikihouse.cc)

## Development setup

Prerequisites:

* Ruby 2.4.0
* PostgreSQL with [contrib
  module](https://www.postgresql.org/docs/9.1/static/contrib.html)

Then run `bin/setup`. This script is idempotent, so it can be re-run if
something fails.

## Environment variables

We rely on environment variables for configuration / secrets. Any
`key=value` pairs specified in a `.env` file will be automated loaded
when the application starts.

You don't need an `.env` file to run the tests or use the application in
development mode, but certain external interactions won't work. To pull
down the production environment variables, run `bin/copy_production_env`
(this script will strip out various variables which we shouldn't be
using in development).

## Copying production database locally

**WARNING**: This will wipe out your existing data in the
`wikihouse_development` database

    $ bin/copy_production_database

## Day-to-day development

Run `heroku local` to start a web server and a job worker (see
`Procfile`). You can now visit the site at http://localhost:5000/.

Run `rspec` to run the tests.

## Deploying

The github master branch is auto-linked to heroku, so a simple `git
push` will put your code on github and heroku at the same time.

Migrations need to be run manually:

    $ heroku run rake db:migrate -a wikihousecc

## Staging

Push to the `master` branch of the `staging` remote:

    $ git push staging myfeaturebranch:master

To run migrations:

    $ heroku run rake db:migrate -a wikihousecc-staging

View the app at https://staging.wikihouse.cc

## DNS

Managed by CloudFlare

## Monitoring

The site is periodically pinged by uptimerobot.
