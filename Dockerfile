FROM mcr.microsoft.com/vscode/devcontainers/python:0-3.11-bullseye

ARG NODE_VERSION="16"
ARG POETRY_VERSION="1.3.1"

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
RUN su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"

RUN python3 -m pip install poetry==1.3.1
