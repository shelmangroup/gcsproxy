FROM golang:1.10 as build
WORKDIR /go/src/gcsproxy
ADD . /go/src/gcsproxy
RUN go install .

FROM gcr.io/distroless/base
COPY --from=build /go/bin/gcsproxy /gcsproxy
EXPOSE 8080
ENTRYPOINT ["/gcsproxy"]
