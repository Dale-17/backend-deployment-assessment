# Stage 1: Build the Go application
FROM golang:1.25.1-alpine AS builder

WORKDIR /src

# Copy Go dependency files first
COPY app/Server/MuchToDo/go.mod app/Server/MuchToDo/go.sum ./

# Download dependencies
RUN go mod download

# Copy the application source code
COPY app/Server/MuchToDo/ ./

# Compile the application
RUN CGO_ENABLED=0 GOOS=linux go build -o /muchtodo ./cmd/api

# Stage 2: Run the application
FROM alpine:3.22

RUN apk add --no-cache ca-certificates

WORKDIR /app

# Copy the compiled application
COPY --from=builder /muchtodo ./muchtodo

# Copy the example configuration file
COPY app/Server/MuchToDo/.env.example ./.env

EXPOSE 8080

CMD ["./muchtodo"]
