# wikihouse.cc

The new wikihouse website https://wikihouse.cc

## Running locally

First get the required vars -

`heroku config -s -a wikihousecc > .env` (check bin/setup)

## Deploying

The github master branch is auto-linked to heroku, so a simple `git push` will put your code on github and heroku at the same time.

## DNS

Managed by CloudFlare

## Monitoring

The site is periodically pinged by uptimerobot.
