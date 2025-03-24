# syntax=docker/dockerfile:1

# build stage
FROM golang:1.24 AS builder

LABEL version="1.0"
LABEL description="This is a simple go app"

WORKDIR /src

RUN go mod init example/user/hello

COPY src/ ./src/
RUN CGO_ENABLED=0 go build -v -o /bin/app ./src/hello.go

# runtime stage
FROM gcr.io/distroless/static-debian12:latest-amd64
COPY --from=builder /bin/app /bin/app

# ENTRYPOINT since i want to execute the same executable everytime
# a CMD command can be combined with ENTRYPOINT to pass arguments to the executable
# CMD ["any-flag-i-want-to-pass"]
ENTRYPOINT ["/bin/app"]