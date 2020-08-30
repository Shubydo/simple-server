FROM golang:1.15 AS build

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o simple-server

FROM scratch AS final

# Copy binary created in "build" stage
COPY --from=build /app/simple-server .
EXPOSE 8080

ENTRYPOINT ["/simple-server"]
