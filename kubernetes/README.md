# Task Description

In this readme, i will describe the given tasks and how to test my delivery.

## Task 1: Containerize a go app

### Step 1

Download and Install Docker

### Step 2

Write the Dockerfile with multi-stage (bonus) pipeline given the images from the specification. Make sure that the working directories are correct.

### Step 3

Build the docker image out of the dockerfile. 

```console
docker build --rm -t go-multi-stage .
```

### Step 4

Run the docker image to create a running docker container with the go application. The app is supposed to throw an error with no connection to the database.

```console
docker run --env-file env.list go-multi-stage
```

### Notes

Provide dockerfile for a Postgres database. 

```console
docker run --name postgres-docker -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
```


## Task 2: Deploy the go app to kubernetes

### Step 1

Download and Install Minikube. I have installed version: v1.15.1

### Step 2

Install the Kubernetes command-line tool kubectl. I have installed version: 1.19.4. Start Single-Node cluster.

```console
minikube start —-vm-driver=none
```

Following command prints details of the cluster and its health status.


```console
kubectl cluster-info
```

```console
kubectl get nodes
```

### Step 3

Now we can start deploying applications. The following command deploys the postgres database into our cluster. 

```console
kubectl run postgres-database --image=postgres --port=5432
```



### Final Notes

There is a kubernetes dashboard that can be used to check your deployment in a UI.

```console
minikube dashboard — url
```