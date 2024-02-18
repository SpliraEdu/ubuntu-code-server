#! /bin/bash
x11vnc -forever -usepw -create &                  # Start VNC server
code-server --bind-addr 0.0.0.0:8080 --auth none  # Start VSCode