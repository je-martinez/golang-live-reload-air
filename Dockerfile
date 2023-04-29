# Use the official Golang image as the base image
FROM golang:alpine

# Set the working directory to /app
WORKDIR /app

# Copy the go.mod and go.sum files to the container
COPY go.mod go.sum ./

# Download the Go dependencies
RUN go mod download

# Copy the rest of the application code to the container
COPY . .

# Install Air
RUN go install github.com/cosmtrek/air@latest

# Expose port 8080
EXPOSE 8080

# Start the application
CMD ["air"]
