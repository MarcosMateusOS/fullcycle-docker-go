FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY . .

RUN go mod init fullcycle-go 

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]