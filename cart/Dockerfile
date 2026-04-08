FROM node:20
# node:20 is Debian-based Alpine image, so we need to install bash and curl with apt.
RUN apt-get update && apt-get install -y --no-install-recommends bash curl && rm -rf /var/lib/apt/lists/*
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install
ENV REDIS_HOST="redis" \
    CATALOGUE_HOST="catalogue" \
    CATALOGUE_PORT="8080"
CMD ["node","server.js"]

# FROM node:20-alpine3.21 AS builder
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install

# FROM node:20-alpine3.21
# RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
# ENV REDIS_HOST="redis" \
#     CATALOGUE_HOST="catalogue" \
#     CATALOGUE_PORT="8080"
# WORKDIR /opt/server
# USER roboshop
# COPY --from=builder /opt/server /opt/server
# CMD ["node","server.js"]

