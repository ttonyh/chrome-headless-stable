# Base docker image
# FROM debian:sid
FROM debian:9.3-slim

LABEL "version"="1.4.0"
LABEL "chrome-version"="65.0.3325.162"
LABEL "github-repo"="ttonyh/chrome-headless-stable"

ENV CHROMEHOME=/home/chrome
ENV DATADIR=$CHROMEHOME/data

# Install Chrome
RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
    dumb-init \
	curl \
	gnupg \
	hicolor-icon-theme \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpango1.0-0 \
	libpulse0 \
	libv4l-0 \
	fonts-symbola \
	--no-install-recommends \
	&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
	&& apt-get update && apt-get install -y \
	google-chrome-stable \
	--no-install-recommends \
	&& apt-get purge --auto-remove -y curl \
	&& rm -rf /var/lib/apt/lists/*

# Add chrome user
RUN groupadd -r chrome && useradd -r -g chrome -G audio,video chrome \
    && mkdir -p /home/chrome/Downloads && chown -R chrome:chrome $CHROMEHOME

RUN mkdir -p $DATADIR && chown -R chrome:chrome $DATADIR

COPY local.conf /etc/fonts/local.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Run Chrome as non privileged user
USER chrome

# Expose port 9222
EXPOSE 9222

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/usr/local/bin/entrypoint.sh" ]





