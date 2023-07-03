FROM ubuntu:latest

ARG HURL_VERSION=4.0.0

RUN apt update && apt install -y curl jq ca-certificates libc6 libcurl4 zlib1g libxml2
RUN curl -LO "https://github.com/Orange-OpenSource/hurl/releases/download/${HURL_VERSION}/hurl_${HURL_VERSION}_amd64.deb"

# Use apt install to determine package dependencies instead of dpkg
RUN apt -y install "./hurl_${HURL_VERSION}_amd64.deb"
RUN rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        \
        # .NET dependencies
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libstdc++6 \
        zlib1g \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -Channel 6.0 -InstallDir /usr/share/dotnet \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

ENTRYPOINT [ "" ]
