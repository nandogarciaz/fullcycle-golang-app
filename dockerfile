FROM golang:1.21-alpine3.19 AS builder
RUN apk add --no-cache go upx
WORKDIR /app
COPY  . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o main 
RUN upx --best main

FROM scratch as final
COPY --from=builder /app/main /main
CMD  [ "/main" ]