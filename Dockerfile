FROM golang:1.15-alpine AS build
COPY . /app
ENV CGO_ENABLED=0
WORKDIR /app
RUN go build -o bank ./cmd/bank

FROM alpine:3.7
COPY --from=build /app/bank /app/bank
CMD ["/app/bank"]
EXPOSE 9999