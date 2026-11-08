# Build stage
FROM golang:1.25-alpine AS builder

WORKDIR /app

COPY app/Server/MuchToDo/go.mod app/Server/MuchToDo/go.sum ./

RUN go mod download

COPY app/Server/MuchToDo/ .

RUN CGO_ENABLED=0 GOOS=linux go build -o /muchtodo ./cmd/api


FROM alpine:3.20

RUN adduser -D -g '' appuser

WORKDIR /home/appuser

COPY --from=builder /muchtodo .

USER appuser

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/health || exit 1

CMD ["./muchtodo"]