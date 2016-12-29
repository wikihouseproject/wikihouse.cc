# wikihouse.cc

The new wikihouse website https://wikihouse.cc

## Running locally

First get the required vars -

`heroku config -s -a wikihousecc > .env`

Run with `rails s`, please note, this will be using the live database. Try not to do anything destructive!

## Deploying

The github master branch is auto-linked to heroku, so a simple `git push` will put your code on github and heroku at the same time.

## DNS

Managed by CloudFlare

## Monitoring

The site is periodically pinged by uptimerobot.
