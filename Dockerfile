# Use Arch Linux as the base image
FROM archlinux:latest

# Install necessary packages, such as bash and bc (required for your script)
RUN pacman -Syu --noconfirm bash bc

# Create a user and set up the home directory
RUN useradd -m -s /bin/bash mmw-user

COPY bin/mmw-config /usr/local/bin/

# Set the working directory to the user's home directory
WORKDIR /home/mmw-user

# Switch to the new user
USER mmw-user

# Set the entry point to start a bash session or run the mmw-config script
ENTRYPOINT ["/bin/bash"]

