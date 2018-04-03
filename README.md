# chrome-headless-stable
Stable version of Google Chrome browser in headless mode. Created mainly for AWS/ECS Compatibility.



# ENV VARS

OPTS_NO_AUTO_RESPAWN = Disable auto respawn of chrome process



```
docker build -t ttonyh/chrome-headless-stable:<VERSION> .
docker tag ttonyh/chrome-headless-stable:<VERSION> ttonyh/chrome-headless-stable:latest
docker push ttonyh/chrome-headless-stable:latest
docker push ttonyh/chrome-headless-stable:<VERSION>
```



```
docker build -t ttonyh/chrome-headless-stable:<VERSION> . \
&& docker tag ttonyh/chrome-headless-stable:<VERSION> ttonyh/chrome-headless-stable:latest \
&& docker push ttonyh/chrome-headless-stable:latest \
&& docker push ttonyh/chrome-headless-stable:<VERSION>
```






