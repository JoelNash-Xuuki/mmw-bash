# Use a base image with bash
FROM alpine:latest

# Set working directory
WORKDIR /mmw

# Copy all your scripts into the container
COPY . .

# Make all your scripts executable
RUN chmod +x *.sh

# Specify the script to run when the container starts
CMD ["./bin/mmw-config"]
