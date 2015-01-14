#
# Dockerfile for langrisha/npm_lazy
#
# A Docker container to speed up your NPM deploys http://mixu.net/npm_lazy/.
#
# See:
#   npm_lazy project page
#     http://mixu.net/npm_lazy/
#   mixu/npm_lazy repository
#     https://github.com/mixu/npm_lazy/
#   configuration defaults (effectively applied)
#     https://github.com/mixu/npm_lazy/blob/master/config.js
#   docker hub
#     https://registry.hub.docker.com/u/langrisha/npm_lazy/
#   docker source repository
#     https://github.com/langri-sha/docker-npm_lazy/
#

# Based on the much regarded Google Node.js image.
FROM google/nodejs

# Fetch, extract and install latest release of mixu/npm_lazy.
RUN mkdir /npm_lazy && cd $_ && \
  curl --location https://github.com/mixu/npm_lazy/archive/v1.7.0.tar.gz | \
  tar xvz --strip-components=1 && \
  npm install

# Work in the application directory.
WORKDIR /npm_lazy

# Location of the NPM package cache.
VOLUME ["/root/.npm_lazy"]

# Expose the bound server port.
EXPOSE 8080

# Start the npm_lazy server on entry.
ENTRYPOINT ["npm", "start"]