# Worksheet

In this documentation, I will describe all my tasks and what I have learned going through this homework. The goal is to summarize the experience with my own words. 


# Docker Commands

Here is a list of commands I have compiled which was also used during the homework. This shall merely function as a look-up list when needed.

```console
docker images
```

```console
docker container ls
```

Shows various information.

```console
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```

remove docker none images


```console
docker rm $(docker ps -a -q)
```

Remove all stopped containers


```console
-p 192.168.1.100:8080:80
```

Map TCP port 80 in the container to port 8080 on the Docker host for connections to host IP 192.168.1.100.

---------------------------------------------------------------------

Kubernetes Commands

```console
kubectl get pods
```

Display kubernetes pods

```console
kubectl get deployment
```

List all your deployments


```console
kubectl delete pod postgres-database --now
```

Delete Kubernetes pod

