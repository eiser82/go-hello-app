## Build

FROM golang:1.16-alpine AS build

WORKDIR /app

COPY go.mod ./
# COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /hello-app


## Deploy

FROM alpine:latest

WORKDIR /

COPY --from=build /hello-app /hello-app

EXPOSE 8080

ENTRYPOINT ["/hello-app"]