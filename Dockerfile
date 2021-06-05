FROM ruby:2.7.2-alpine3.11

RUN apk update && apk add --update \
  build-base \
  curl \
  git \
  nodejs \
  npm \
  python2 \
  postgresql-dev \
  postgresql-client \
  graphicsmagick &&\
  apk add -u yarn

RUN mkdir /app
WORKDIR /app

# NOTE This must match "BUNDLED WITH" in Gemfile.lock
RUN gem install bundler:2.2.4

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN set -ex; \
  yarn install --frozen-lockfile; \
  yarn cache clean;

ENV BUNDLE_FORCE_RUBY_PLATFORM=1

COPY . .

# Cleanup
RUN rm -rf /var/cache/apk/*

CMD ["rails", "server", "-b", "0.0.0.0"]