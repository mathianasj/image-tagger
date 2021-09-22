FROM curlimages/curl

COPY tag.sh tag

CMD ["tag"]
