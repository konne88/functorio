# FROM mcr.microsoft.com/devcontainers/universal:2
FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update && apt-get install -y \
    ripgrep \
    pigz

USER vscode
ENV ELAN_HOME="/home/vscode/.elan"
ENV PATH="${ELAN_HOME}/bin:${PATH}"
RUN sh -c 'curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y'
RUN elan self update
RUN elan default leanprover/lean4:stable
RUN lean --version
