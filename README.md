replicas-proxy
==============

A drop-in (maybe) way to connect to Wikimedia Replicas through Docker environments.


Problems
--------

* Mount SSH_AUTH ?
--> Does not work on Mac

* but otherwise, key prompt...


```
Host wiki-relicas-tunnel
    HostName tools-login.wmflabs.org
    IdentityFile ~/.ssh/wikitech
    User jeanfred
    ForwardAgent yes
    TCPKeepAlive yes
    ConnectTimeout 5
    ServerAliveCountMax 10
    ServerAliveInterval 15
```