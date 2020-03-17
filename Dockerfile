FROM alpine:3.10

label maintainer="Brett Palmberg <brett.t.palmberg@gmail.com>"

RUN apk --no-cache add bash py3-pip && pip3 install --no-cache-dir awscli

ADD watch /watch

# User 5050 (pgadmin) is container user for dpage/pgadmin4
# Using the same user allows shared volumes between containers
RUN adduser --disabled-password --uid 5050 pgadmin && \
    mkdir /data && \
    chown -R pgadmin:pgadmin /data

VOLUME /data

USER pgadmin

ENTRYPOINT [ "./watch" ]
CMD ["/data"]
