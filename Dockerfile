# Use Arch Linux as the base image
FROM archlinux:latest

# Install necessary packages, such as bash and bc (required for your script)
RUN pacman -Syu --noconfirm bash bc git ffmpeg lilypond csound sox alsa-utils

# Create a user and set up the home directory
RUN useradd -m -s /bin/bash mmw-user

COPY bin/mmw-config /usr/local/bin/
COPY bin/mmw /usr/local/bin/

COPY test/mmw-config/mmw-config.bats /usr/local/bin/
COPY test/mmw/mmw.bats /usr/local/bin/
COPY test/mmw/mmw-score.bats /usr/local/bin/

# Set the working directory to the user's home directory
WORKDIR /home/mmw-user

# Switch to the new user
USER mmw-user

RUN git init
RUN git submodule add https://github.com/bats-core/bats-core.git test/bats
RUN git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support
RUN git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert

# Set the entry point to start a bash session or run the mmw-config script
ENTRYPOINT ["/bin/bash"]

