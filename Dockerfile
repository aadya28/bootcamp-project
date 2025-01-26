FROM elixir:1.15-alpine AS build
RUN apk add --no-cache build-base git curl
RUN mix local.hex --force
WORKDIR /app
COPY ./  ./
RUN rm -rf _build deps
RUN mix deps.get
RUN mix assets.deploy
EXPOSE 4000
CMD ["mix", "phx.server"]