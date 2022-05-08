# Docker

## List docker containers
```
sudo docker ps -a
```

## Connect to a container
```
sudo docker exec -it 6e2234c0c0e6 /bin/bash
```

## Inspect docker logs
```
sudo docker logs --tail 100 my-container-name
```

## Get docker stats by container id
```
sudo docker stats 6e2234c0c0e6
```

## Get docker top by container id
```
sudo docker top 6e2234c0c0e6
```

## Get a list of connected machines
```
arp -a
```

## Where do docker logs live
```
/var/lib/docker/vfs/dir/
```

## Docker logs are stores here
```
/var/lib/docker/containers/[container-id]/[container-id]-json.log
```

## Find Docker container logs
```
find /var/lib/docker/containers/ -type f -iname “*container id*”
```

## Login to docker registry
```
sudo docker login -u username -p password docker.registry.com

```

## Pull down an image with a tag
```
sudo docker pull docker.registry.com/myproject/image
```

## Delete an image by image id
```
sudo docker rmi 67075148bd63
```

