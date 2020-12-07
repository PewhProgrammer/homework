# Worksheet

In this documentation, I will describe all my tasks and what I have learned going through this homework. The goal is to summarize the experience with my own words. 

## What is BOSH?

[TODO]

BOSH is designed/inspired by the idea of Google's scale and control (BORG). It provides an instance of managing a cluster of VMs by using components like CPI, Directors, Agents and embedded OS. It allows enterprises to upgrade their critical infrastructure by applying rolling-update methods through their APIs. From the security aspect, we are able to define lifespans which enables automatic recreation of VMs/Secrets/Credentials and thus reduces the possibility of malwares/malfunctions.

## What does CPI stand for? 

Cloud Provider Interface is a collection of 15 API that enables provisioning of VMs, Disks and Networks between the Director and the Infrastructure.

## What is bosh-cli?

bosh-cli is the main tool to operate bosh through terminal commands. As of now, we currently have CLI v2 which introduces statelessness and hypentation on single commands - an improvement to its predecessor version. The core functionality are [TODO]

## How did I install and run BOSH Lite?

Since I am natively developing on Windows, I tried to find a solution for the BOSH Lite installation since some commands - such as bosh create-env - were not functional on Windows ( [as of this writing](https://bosh.io/docs/cli-v2-install/)). WSL lets you run a Linux environment -- including command-line tools and applications -- directly on Windows, without the overhead of a traditional virtual machine or dualboot setup. In here, I was able to install bosh-cli using homebrew and virtualbox on an ubuntu 20.04 LTS distro. The bosh create-env command worked.

https://medium.com/solacedotcom/yes-you-can-run-bosh-lite-v2-on-windows-10-b55f679640b9

However, VirtualBox does not run flawlessly on WSL because it does not support run-level functionality. After many attempts, I have run out of disk space on my laptop so I decided to use Bosh inside of my VM at the end. Maybe, some day, I will return to WSL or fully turn to linux/OS X systems since it seems to be the more feasible approach.

## What is the typical workflow of Bosh?

Before any deployment, we will have to spin-up the Director VM which has its very own stemcell and packages. The director is responsible for the orchestration and manages the agents.

1. Bosh receives stemcells and releases. This data describes the deployed systems in respect to OS, jobs and running softwares.
2. Bosh deploys the software systems using a deployment manifest (.yml). Several instances are deployed progressively.
3. Bosh monitors the instances for malfunctions continuously. It is able to restart instances
4. Bosh can be told to apply a rolling-update using the deployment manifest.

## What happens upon recovery?

There is a special process called Monit which lives inside of a VM and checks if the instances are still running, e.g. Instance A dies. Monit will replicate Instance B to re-create Instance A. Sometimes a datacenter is faulty and a VM crashes. Bosh will terminate the VM and install a fresh VM in respect to the manifest. This can be scaled up to data centers or availability zones.

## Deployment - Step by Step
On a usual deployment, BOSH deploys itself. When we start a deployment, we usually have a BOSH Director (a VM) which uses the CPI to communicate to our infrastructure (Cloud or bare metal computer). Then we spin-up several BOSH Agents (multiple VMs) which handles the core process.

[Reference](https://bosh.io/docs/deploying-step-by-step/)

# Reminder Terminology

Interesting and important notions or items will be listed here.

## Manifest, Stemcell, Release

- Deployment Specification
- OS + BOSH Specifics (like agents)
- Versioned Software Package

## Deployment State File

The deployment state encapsulates various information such as disks, stemcells and releases. It also describes various IDs - such as the director VM id. It is primarily used to create or start an environment.

Defined by --state=<name>.json in a bosh command.

# Bosh CLI-v2 Commands

Here is a list of commands I have compiled which was also used during the homework. This shall merely function as a look-up list when needed.

```console
user@workspace:~$ bosh create-env bosh.yml --state=bosh.json
```

Bosh creates an environment given input a deployment manifest and a deployment state file.


```console
user@workspace:~$ bosh -e vbox -d nginx vms
```

Display the deployed vms for my nginx release.

```console
user@workspace:~$ bosh -e vbox env --details
```

Display Director Environment (alias vbox) details.

```console
user@workspace:~$ bosh -e vbox ss 
```

Displays all stemcells uploaded into Director. ss is alias for stemcells. You can replace the later part with: releases, config, cloud-config.

```console
user@workspace:~$ bosh envs
```

List all available aliases on the host

```console
user@workspace:~$ bosh -e vbox -d nginx ssh nginx
```

SSH Into VM