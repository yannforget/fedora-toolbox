#!/bin/sh
# Install fish shell as default shell

sudo dnf install -y \
    util-linux-user \
    fish

sudo usermod --shell /usr/bin/fish $USER