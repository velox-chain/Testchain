FROM ubuntu:22.04

RUN apt update && apt install -y curl ca-certificates

RUN curl -L https://github.com/0xPolygon/polygon-edge/releases/latest/download/polygon-edge-linux-amd64 -o polygon-edge
RUN chmod +x polygon-edge
RUN mv polygon-edge /usr/local/bin/polygon-edge

WORKDIR /app

COPY start.sh .
COPY genesis.json .

RUN chmod +x start.sh

EXPOSE 8545

CMD ["./start.sh"]
