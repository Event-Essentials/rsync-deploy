FROM debian:9.5-slim

RUN apt update
RUN apt -yq install rsync openssh-client

LABEL "com.github.actions.name"="Deploy with rsync"
LABEL "com.github.actions.description"="Deploy to a remote server using rsync over ssh"

LABEL "repository"="http://github.com/Event-Essentials/rsync-deploy"
LABEL "homepage"="https://github.com/Event-Essentials/rsync-deploy"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]