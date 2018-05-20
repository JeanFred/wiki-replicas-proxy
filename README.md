replicas-proxy
==============

A drop-in (maybe) way to connect to Wikimedia Replicas through Docker environments.


mediawiki-core-empty
--------------------

Just the schema of MediaWiki Core loaded inside a MariaDB container, with no data.

Not the most useful thing, but may be enough to prevent your code from crashing.

```
version: '2'
services:
  app:
    environment:
      DB_HOST: db
    links:
      - db

  db:
    image: mediawiki-core-empty
    volumes:
      - ./mysql:/etc/mysql/conf.d
    environment:
      MYSQL_ROOT_PASSWORD: root_password
      MYSQL_DATABASE: commonswiki_p
      MYSQL_USER: username
      MYSQL_PASSWORD: password
```

toolforge-proxy
---------------

Proxies through to Toolforge to connect to the actual Wiki-Replicas.

Several methods are possible:

### Variables

* `WIKI_DB`: the Wiki database to connect to − e.g. `enwiki` or `commonwiki`
* `SERVICE`: The [service](https://phabricator.wikimedia.org/phame/post/view/70/new_wiki_replica_servers_ready_for_use/), either `web` or `analytics`. Defaults to `analytics`
* `SSH_USER`: Your Toolforge username. Defaults to None (which will probably only work if you mount your SSH config.
* `HOST`: The SSH to proxy to. Defaults to `tools-login.wmflabs.org`

### ssh-agent

Using the ssh-agent by mounting/passing SSH_AUTH_SOCK. This way you do not have to mount your keysThis may not work on OSX.
```
version: '2'
services:
  app:
    environment:
      DB_HOST: db
      DB_USERNAME: $TOOLFORGE_DB_USERNAME
      DB_PASSWORD: $TOOLFORGE_DB_PASSWORD
    links:
      - db

  db:
    image: toolforge-proxy
    volumes:
      - $SSH_AUTH_SOCK:$SSH_AUTH_SOCK
    environment:
      SSH_USER: jeanfred
      WIKI_DB: commonswiki
      SSH_AUTH_SOCK:
```

### ssh folder mount

```
version: '2'
services:
  app:
    environment:
      DB_HOST: db
      DB_USERNAME: $TOOLFORGE_DB_USERNAME
      DB_PASSWORD: $TOOLFORGE_DB_PASSWORD
    links:
      - db

  db:
    image: toolforge-proxy
    volumes:
      - $HOME/.ssh:/root/ssh:ro
    environment:
      SSH_USER: jeanfred
      WIKI_DB: commonswiki
```

