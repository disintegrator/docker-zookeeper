docker-zookeeper
================

To build and run:

    sudo docker build -t $USER/zookeeper github.com/disintegrator/docker-zookeeper
    sudo docker run --name zk $USER/zookeeper

To start a shell that can talk to a running zookeeper instance with name zk:

    sudo docker run --link zk:zk --rm --entrypoint="/bin/bash" $USER/zookeeper -l
