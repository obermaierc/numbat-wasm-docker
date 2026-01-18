FROM rust:1-bullseye AS build

RUN cargo install wasm-pack

WORKDIR /app
RUN git clone https://github.com/sharkdp/numbat.git

RUN cd numbat/numbat-wasm && bash build.sh

FROM nginx:1.29

COPY --from=build /app/numbat/numbat-wasm/www /usr/share/nginx/html

LABEL org.opencontainers.image.source=https://github.com/obermaierc/numbat-wasm-docker
LABEL org.opencontainers.image.description="dockized numbat wasm"
