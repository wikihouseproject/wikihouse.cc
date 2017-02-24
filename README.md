# [wikihouse.cc](https://wikihouse.cc)

[![Code Climate](https://codeclimate.com/github/wikihouseproject/wikihouse.cc/badges/gpa.svg)](https://codeclimate.com/github/wikihouseproject/wikihouse.cc) [![Issue Count](https://codeclimate.com/github/wikihouseproject/wikihouse.cc/badges/issue_count.svg)](https://codeclimate.com/github/wikihouseproject/wikihouse.cc/issues) [![Build Status](https://travis-ci.org/wikihouseproject/wikihouse.cc.png)](https://travis-ci.org/wikihouseproject/wikihouse.cc)

The official WikiHouse Foundation website.

[![WikiHouse Logo](public/apple-icon-120x120.png)](https://wikihouse.cc)

## Development setup

Prerequisites:

* Ruby 2.4.0
* PostgreSQL
* Heroku credentials

Then run `bin/setup`. This script is idempotent, so it can be re-run if
something fails.

## Copying production database locally

    $ dropdb wikihouse_development
    $ heroku pg:backups:download -a wikihousecc
    $ pg_restore --verbose --clean --jobs=4 --disable-triggers --no-acl --no-owner -h localhost -d wikihouse_development latest.dump
    $ rm latest.dump

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
