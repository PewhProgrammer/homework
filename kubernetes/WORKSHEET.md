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