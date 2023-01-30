FROM ruby:3.2.0 AS pre_release

WORKDIR /usr/src/app

RUN gem install bundler

COPY gems.* /usr/src/app/

COPY . /usr/src/app

RUN bundle install -j5

FROM ruby:3.2.0 AS release

WORKDIR /usr/src/app

RUN \
  apt update && \
  apt upgrade -y

COPY --from=pre_release /usr/local/bundle/ /usr/local/bundle/
COPY --from=pre_release /usr/src/app/ /usr/src/app/
