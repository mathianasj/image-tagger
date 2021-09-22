FROM registry.access.redhat.com/ubi8/ubi-minimal:latest 

COPY tag.sh /usr/local/bin/tag

CMD ["tag"]
