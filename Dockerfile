# Build stage
FROM golang:1.23-alpine AS builder

ARG GLANCE_VERSION

RUN apk add --no-cache git

WORKDIR /src
RUN git clone --branch ${GLANCE_VERSION} --depth 1 https://github.com/glanceapp/glance.git .

ARG TARGETOS
ARG TARGETARCH
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags="-s -w" -o /glance .

# Runtime stage
FROM gcr.io/distroless/static-debian12

COPY --from=builder /glance /glance

EXPOSE 8080

ENTRYPOINT ["/glance"]
