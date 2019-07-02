FROM alpine:latest

LABEL \
  org.label-schema.schema-version="1.0" \
  org.label-schema.name="cron" \
  org.label-schema.vcs-url="https://github.com/instantbox/cron" \
  maintainer="Instantbox Team <team@instantbox.org>"
 
RUN apk add --no-cache \
  dcron \
  curl \
  wget \
  rsync \
  ca-certificates \
  ;

RUN mkdir -p /var/log/cron \
  && mkdir -m 0644 -p /var/spool/cron/crontabs \
  && touch /var/log/cron/cron.log \
  && mkdir -m 0644 -p /etc/cron.d

COPY /scripts/* /

ENTRYPOINT ["/docker-entry.sh"]
CMD ["/docker-cmd.sh"]

ARG VCS_REF
ARG BUILD_DATE
LABEL \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.build-date=$BUILD_DATE
