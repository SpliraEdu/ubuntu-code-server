FROM ubuntu

# Update Ubuntu packages
RUN apt update -y
RUN apt-get autoclean

# Install tools
RUN apt install -y curl

# Install VNC server
RUN apt install -y x11vnc xvfb
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd

# Install VSCode
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install Python
RUN apt install -y python3

# Install NodeJS
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN source ~/.nvm/nvm.sh && nvm install --lts && nvm use --lts

# Startup script
COPY ./start.sh /
RUN chmod a+rx ./start.sh
CMD ./start.sh
