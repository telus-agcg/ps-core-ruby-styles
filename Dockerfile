FROM ruby:3.1.1

WORKDIR /usr/src/app

COPY gems.rb .
COPY ps-core-ruby-styles.gemspec .
COPY VERSION .

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  gem update --system && \
  gem install bundler && \
  bundle install -j5

COPY . /usr/src/app
