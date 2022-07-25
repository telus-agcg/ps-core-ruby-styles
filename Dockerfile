FROM ruby:3.1.1-alpine3.15

WORKDIR /usr/src/app

COPY gems.rb .
COPY ps-core-ruby-styles.gemspec .
COPY VERSION .

RUN \
  apk update && \
  apk upgrade && \
  apk add --no-cache build-base git openssh ruby-dev && \
  gem update --system && \
  gem install bundler && \
  bundle install -j5 && \
  apk del build-base ruby-dev

COPY . /usr/src/app
