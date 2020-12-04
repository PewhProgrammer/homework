### BUILD STAGE ###
FROM golang:latest AS build
RUN mkdir /app
COPY . /app/
WORKDIR /app/go-app

## Add this go mod download command to pull in any dependencies
# RUN go mod download

## Our project will now successfully build with the necessary go libraries included.
RUN go build -o main .



### RUN STAGE ###
FROM alpine:latest
RUN mkdir /app
COPY --from=build /app/go-app /app
WORKDIR /app
## Our start command which kicks off our newly created binary executable that was carried over from the build stage
CMD ["./main"]