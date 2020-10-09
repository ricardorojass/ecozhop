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
FROM bitwalker/alpine-elixir-phoenix:latest

# install build dependencies
RUN apk add --update git

# prepare build dir
RUN mkdir /app
COPY . /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix hex.info

RUN mix do compile

CMD mix deps.get && cd assets && npm install && cd .. && mix phx.server