# create multi stage docker
# BUILD STAGE
FROM golang:1.21.1-alpine as builder

# set the working directory
WORKDIR /app

COPY . .

# Build the app
RUN go build -o myApp

# use a smaller image to reduce thr size of final container
FROM alpine:latest

# set working directory
WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/myApp .

# run the app
CMD [ "./myApp" ]

