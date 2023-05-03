FROM openjdk:17-slim

RUN apt update && apt install -y \
    wget jq \
    && rm -rf /var/lib/apt/lists/*

RUN ln -fs /usr/share/zoneinfo/${TZ:-Europe/Stockholm} /etc/localtime
RUN dpkg-reconfigure tzdata -f noninteractive

COPY entrypoint /entrypoint

EXPOSE 25565
EXPOSE 25565/udp

WORKDIR /buddacraft
# Start script
ENTRYPOINT ["/entrypoint"]
