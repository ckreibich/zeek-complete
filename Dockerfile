ARG VERSION=latest

FROM zeek/zeek:${VERSION}

RUN apt-get -q update \
 && apt-get install -q -y --no-install-recommends \
      bash-completion \
      python3-argcomplete \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Debian: uncomment the completion-enabling block that should be in /etc/bash.bashrc:
RUN grep -q '^# enable bash completion' /etc/bash.bashrc
RUN sed -i '/^# enable bash completion/,/^#fi/ { /^# enable bash completion/! s/^#// }' /etc/bash.bashrc

# Install the completion:
COPY zeek /etc/bash_completion.d/
COPY zeek-complete /usr/local/zeek/bin/
