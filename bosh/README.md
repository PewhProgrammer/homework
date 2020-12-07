# Task Description

In this readme, i will describe the given tasks and how to test my delivery.

## Task 1: BOSH Lite with nginx release

### Step 0

Installation of BOSH Lite on Ubuntu 18.04 LTS. Create your first environment and check if Director VM is running.

### Step 1

Create a cloud config with all the needed information specific to the infrastructure such as availability zones and network data. I have used some example files from the official bosh deployments repository and adjusted some parameters. Please use this during your deployment as I have reserved some IP addresses.

```console
user@workspace:~$ bosh -e vbox update-cloud-config cloud-config.yml
```


### Step 2

Upload your nginx release from the bosh.io official release page. There are two ways to do it: either through the deployment manifest or cli command.

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

After uploading the release and the respective stemcell, we are going for the deployment.

```console
user@workspace:~$ bosh -e vbox -d nginx deploy ./nginx.yml
```


### Final Step

Upon verifying that everything runs smoothly, we can now try to send a curl GET request to our running nginx server. In our small sample project, I have exposed the port 192.168.50.6. However, we will need to route the private IP address from inside the BOSH VM to make it accessible for the host machine. Refer to the official [bosh lite documentation ](https://bosh.io/docs/bosh-lite/#install). I have used the linux variant. Check with the following command:

```console
user@workspace:~$ curl -i 192.168.192.201
```

Dont forget to local route to access the address!
Now we can add [basic authentication](https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-http-basic-authentication/) to our nginx server. Here, we will need to configure a (pre-script)[https://bosh.io/docs/pre-start/] which runs before the actual job. The pre-script will handle the creation of a auth file which nginx will use for its basic auth. To test the configuration:

```console
user@workspace:~$ curl -i -u admin:anynines 192.168.192.201
```