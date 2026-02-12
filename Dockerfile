FROM ubuntu:22.04

RUN apt update && apt install -y curl ca-certificates

# Use fixed stable version
RUN curl -L https://github.com/0xPolygon/polygon-edge/releases/download/v1.3.3/polygon-edge-linux-amd64 -o /usr/local/bin/polygon-edge

RUN chmod +x /usr/local/bin/polygon-edge

WORKDIR /app

COPY start.sh .
COPY genesis.json .

RUN chmod +x start.sh

EXPOSE 8545

CMD ["./start.sh"]
