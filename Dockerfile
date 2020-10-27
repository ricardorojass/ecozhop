########################################
# 1. Build nodejs frontend
########################################
FROM node:12-alpine as build-node

# prepare build dir
RUN mkdir -p /app/assets
WORKDIR /app

# set build ENV
ENV NODE_ENV=prod

# install npm dependencies
COPY assets/package.json assets/package-lock.json ./assets/
COPY deps/phoenix deps/phoenix
COPY deps/phoenix_html deps/phoenix_html
RUN cd assets && npm install

########################################
# 2. Build elixir backend
########################################
FROM elixir:1.10-alpine as builder

ENV PORT=4000
ENV MIX_ENV=prod
COPY lib ./lib
COPY config ./config
COPY mix.exs .
COPY mix.lock .

# prepare build dir
# RUN mkdir /app
# COPY . /app
# WORKDIR /app

# install hex + rebar
RUN mix local.rebar --force \
    && mix local.hex --force \
    && mix deps.get \
    && mix release

# RUN mix do compile

# CMD cd assets && npm install && npm rebuild node-sass && cd .. && mix phx.server

# 3. Install bash openssl and run app
FROM alpine:3
RUN apk add --no-cache --update bash openssl

# EXPOSE 4000
# ENV PORT=4000 MIX_ENV=prod REPLACE_OS_VARS=true SHELL=/bin/bash

WORKDIR /app
COPY --from=builder _build/prod/rel/ecozhop/ .
COPY --from=build-node /app/assets/ .

CMD ["/app/bin/ecozhop", "start"]
# CMD ["/bin/echo", "${PORT}"]
# CMD echo "Hello world, ${PORT}"