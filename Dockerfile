FROM --platform=x86_64 rust:1.79.0-buster as compiler

WORKDIR /usr/src/oxidized-db

COPY . .

RUN cargo build --release   

FROM debian:buster-slim

COPY --from=compiler /usr/src/oxidized-db/target/release/oxidized-db /usr/local/bin/oxidized-db

CMD ["oxidized-db"]
