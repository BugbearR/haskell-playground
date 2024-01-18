FROM mcr.microsoft.com/devcontainers/base:bullseye

ARG USER=vscode
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git \
    python3-pip \
    expect \
    build-essential \
    libffi-dev \
    libffi7 \
    libgmp-dev \
    libgmp10 \
    libncurses-dev \
    libncurses5 \
    libtinfo5 \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/cache/apt/* /var/lib/apt/lists/

RUN if ! getent group $GROUP_ID > /dev/null 2>&1; then groupadd -g $GROUP_ID mygroup; fi
RUN if ! getent passwd $USER_ID > /dev/null 2>&1; then useradd -m -u $USER_ID -g $GROUP_ID $USER; fi

USER $USER_ID

RUN /usr/bin/python3 -m pip install ipykernel -U --user --force-reinstall
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_MINIMAL=1 sh
RUN /home/$USER/.ghcup/bin/ghcup install ghc \
    && /home/$USER/.ghcup/bin/ghcup set ghc
RUN /home/$USER/.ghcup/bin/ghcup install stack \
    && /home/$USER/.ghcup/bin/ghcup set stack
RUN /home/$USER/.ghcup/bin/ghcup install hls \
    && /home/$USER/.ghcup/bin/ghcup set hls
# RUN /home/$USER/.ghcup/bin/ghcup install cabel \
#    && /home/$USER/.ghcup/bin/ghcup set cabel
RUN echo 'export PATH="$HOME/.ghcup/bin:$PATH"' >> /home/$USER/.bashrc

# RUN curl -sSL https://get.haskellstack.org/ | sh
# RUN git clone https://github.com/gibiansky/IHaskell \
#     && cd IHaskell \
#     && pip3 install -r requirements.txt \
#     && stack install --fast \
#     && ihaskell install --stack
# RUN expect -c 'spawn bash -c "curl -fsSL https://install.julialang.org | sh"; expect "Proceed"; send -- "\r"; expect eof'
