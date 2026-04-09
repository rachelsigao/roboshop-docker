# FROM node:20-alpine3.21
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV REDIS_HOST="redis" \
#     CATALOGUE_HOST="catalogue" \
#     CATALOGUE_PORT="8080"
# CMD ["node","server.js"]

# Stage-1: Builder
FROM node:20-alpine3.21 AS builder
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install

# Stage-2: Final image
FROM node:20-alpine3.21
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV REDIS_HOST="redis" \
    CATALOGUE_HOST="catalogue" \
    CATALOGUE_PORT="8080"
WORKDIR /opt/server
USER roboshop
COPY --from=builder /opt/server /opt/server
CMD ["node","server.js"]

