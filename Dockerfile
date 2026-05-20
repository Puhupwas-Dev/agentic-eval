# Use the official uv Python 3.12 slim image from GitHub Container Registry
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

# Expose port 8888 for Jupyter notebook or other services
EXPOSE 8888

# Update package list and install required system packages
RUN apt-get update \
    # Install sudo – allows user to run privileged commands
    && apt-get install -y \
    sudo \
    # curl – command-line tool for transferring data
    curl \
    # git – version control system for cloning repositories
    git \
    # jq – lightweight JSON processor
    jq \
    # tar – archiving utility
    tar \
    # unzip – extract ZIP archives
    unzip \
    # ca-certificates – SSL certificate authorities for HTTPS
    ca-certificates \
    # build-essential – compilers and make for building native code
    build-essential \
    # Clean up apt cache to reduce image size
    && rm -rf /var/lib/apt/lists/*

#######################################################################
# Define the username for the non-root user
ARG USER=coder

# Create user with sudo access, no home directory yet, bash as shell
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
    # Allow passwordless sudo for the user
    && echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
    # Set correct permissions for the sudoers file
    && chmod 0440 /etc/sudoers.d/${USER}

# Switch to the non-root user
USER ${USER}

# Set working directory to the user's home
WORKDIR /home/${USER}
########################################################################

# Copy the entire project source code into the container, preserving ownership
COPY --chown=${USER}:${USER} . /home/${USER}/aieng-template-implementation

# Define the default command: run the setup script
CMD ["bash", "aieng-template-implementation/scripts/setup.sh"]
