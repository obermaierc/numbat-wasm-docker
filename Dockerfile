FROM rust:1-bullseye

RUN cargo install wasm-pack

WORKDIR /app
RUN git clone https://github.com/sharkdp/numbat.git

RUN cd numbat/numbat-wasm && bash build.sh

CMD ["python3", "-m", "http.server", "-d", "/app/numbat/numbat-wasm/www/"]
