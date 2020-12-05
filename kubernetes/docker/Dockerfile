### BUILD STAGE ###
FROM golang:latest AS build
RUN mkdir /app
COPY . /app/
WORKDIR /app/go-app

## Add this go mod download command to pull in any dependencies
RUN go mod download

## Our project will now successfully build with the necessary go libraries included.
# RUN go build -o main .

## Need to adjust the parameters to build the exec for the right architecture. In this case, alpine
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o main .

# CMD ["./main"]


## RUN STAGE ###
FROM alpine:latest
RUN mkdir /app
WORKDIR /app
COPY --from=build /app/go-app/main .

## Our start command which kicks off our newly created binary executable that was carried over from the build stage
CMD ["./main"]