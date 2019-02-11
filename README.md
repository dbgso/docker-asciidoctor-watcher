<div id="header">

README
======

<div id="toc" class="toc">

<div id="toctitle">

Table of Contents

</div>

-   [Introduction](#_introduction)
-   [Quick Start](#_quick_start)
    -   [Simple CLI](#_simple_cli)
    -   [Auto Build with Live Preview](#_auto_build_with_live_preview)

</div>

</div>

<div id="content">

<div class="sect1">

Introduction
------------

<div class="sectionbody">

<div class="paragraph">

Docker image for autobuild [Asciidoctor](https://asciidoctor.org/) with
[filewatcher](https://rubygems.org/gems/filewatcher/versions/0.5.3).

</div>

</div>

</div>

<div class="sect1">

Quick Start 
-----------

<div class="sectionbody">

<div class="sect2">

### Simple CLI

<div class="listingblock">

<div class="content">

``` {.CodeRay .highlight}
docker run --rm -it -v $PWD/data:/data -v $PWD/data:/data dbgso/asciidoctor-watcher
```

</div>

</div>

</div>

<div class="sect2">

### Auto Build with Live Preview

<div class="paragraph">

auto reload browser with
[dbgso/autoreloadserver](https://cloud.docker.com/repository/docker/dbgso/autoreloadserver)

</div>

<div class="listingblock">

<div class="content">

``` {.CodeRay .highlight}
version: '3'

services:
  adoc:
    image: dbgso/asciidoctor-watcher:0.1
    environment:
      - INDEX_FILE=index.adoc
    volumes:
      - document_root:/data
    container_name: adoc_container
    working_dir: '/data'
  nodeapp:
    image: dbgso/autoreloadserver:0.1
    volumes:
      - document_root:/data
    container_name: autoreloadserver
    working_dir: '/data'
    ports:
      - 18080:8080

volumes:
  document_root:
    driver_opts:
      type: none
      device: $PWD/data
      o: bind
```

</div>

</div>

<div class="listingblock">

<div class="content">

``` {.CodeRay .highlight}
mkdir data
docker-compose up -d
sudo chown -R $USERNAME:$USERNAME data
touch data/index.adoc
```

</div>

</div>

<div class="paragraph">

and editing `data/index.adoc`

</div>

</div>

</div>

</div>

</div>
