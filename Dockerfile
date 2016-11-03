FROM alpine
MAINTAINER Konrad Wojas <git@m.wojas.nl>

RUN apk --no-cache add nodejs
ADD package.json /app/package.json
WORKDIR /app
RUN npm install
ADD lib /app/lib
ADD index.js /app

# Volumize the NPM package cache.
VOLUME ["/root/.npm_lazy"]

# Server is listening on 0.0.0.0:8080, by default.
EXPOSE 8080

# Default server arguments.
CMD ["--show-config"]

# Start the server on entry.
ENTRYPOINT ["node", "index.js"]
