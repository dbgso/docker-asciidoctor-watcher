FROM asciidoctor/docker-asciidoctor

RUN gem install -N filewatcher coderay

ENV INDEX_FILE="index.adoc"

VOLUME [ "/data" ]
WORKDIR /data

ENTRYPOINT ["filewatcher"]
CMD ["-l", "**/*.adoc **/*.puml", "asciidoctor -r asciidoctor-diagram ${INDEX_FILE}"]
