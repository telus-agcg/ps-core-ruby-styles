FROM ruby:3.3.0 AS pre_release

WORKDIR /usr/src/app

RUN gem install bundler

COPY gems.* /usr/src/app/
COPY ps-core-ruby-styles.gemspec /usr/src/app/
COPY VERSION /usr/src/app/

RUN bundle install -j5

FROM ruby:3.3.0 AS release

WORKDIR /usr/src/app

RUN \
  apt update && \
  apt upgrade -y

COPY . /usr/src/app

COPY --from=pre_release /usr/local/bundle/ /usr/local/bundle/
