# Task Description

In this readme, i will describe the given tasks and how to test my delivery.

## Task 1: BOSH Lite with nginx release

### Step 0

Installation of BOSH Lite on Ubuntu 18.04 LTS. Create your first environment and check if Director VM is running.

### Step 1

Create a cloud config with all the needed information specific to the infrastructure such as availability zones and network data. I have used some example files from the official bosh deployments repository and adjusted some parameters. 

### Step 2

Upload your nginx release from the bosh.io official release page. There are two ways to do it: either through the deployment manifest or cli command.

```console
user@workspace:~$ bosh -e vbox update-cloud-config cloud-config.yml
```

CLI:

```console
user@workspace:~$ bosh -e vbox upload-release --sha1 1731de7995b785f314e87f54f2e29d3668f0b27f \
  https://bosh.io/d/github.com/cloudfoundry-community/nginx-release?v=1.19.1

```

### Step 3

Upload your stemcells from the bosh.io official stemcell page. I have decided to go with Ubuntu Xenial.

```console
user@workspace:~$ bosh -e vbox upload-stemcell --sha1 c207c26c0528f2c4709317200a6730ceacfdad87 \
  https://bosh.io/d/stemcells/bosh-warden-boshlite-ubuntu-xenial-go_agent?v=621.93

```

### Step 4

After uploading the release, we are going to the deployment.

```console
user@workspace:~$ bosh -e vbox -d nginx deploy ./nginx.yml
```