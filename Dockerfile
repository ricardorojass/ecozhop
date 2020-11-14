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

RUN apk add --update git

WORKDIR /app

ENV PORT=4000
ENV MIX_ENV=prod
COPY lib ./lib
COPY config ./config
COPY mix.exs .
COPY mix.lock .


# install hex + rebar
RUN mix local.rebar --force \
    && mix local.hex --force \
    && mix deps.get \
    && mix phx.digest \
    && mix release

# RUN apk add --no-cache bash openssl
# CMD cd assets && npm install && npm rebuild node-sass && cd .. && mix phx.server

# COPY _build/prod/rel/ecozhop/ .
# COPY --from=build-node /app/priv/static /app/priv/static
ENTRYPOINT ["_build/prod/rel/ecozhop/bin/ecozhop"]
CMD ["start"]