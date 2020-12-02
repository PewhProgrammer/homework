# Task Description

In this readme, i will describe the given tasks and how I managed to solve it with respect to my though process.

# What is BOSH?

[TODO]

# What is bosh-cli?

bosh-cli is the main tool to operate bosh through terminal commands. As of now, we currently have CLI v2 which introduces statelessness and hypentation on single commands - an improvement to its predecessor version. The core functionality are [TODO]

# How did I install and run BOSH Lite?

Since I am natively developing on Windows, I tried to find a solution to installing BOSH since some commands - such as bosh create-env - were not functional on Windows (as of this writing). WSL lets you run a Linux environment -- including command-line tools and applications -- directly on Windows, without the overhead of a traditional virtual machine or dualboot setup. In here, I was able to install bosh-cli using homebrew and virtualbox on an ubuntu 20.04 LTS distro. The bosh create-env command worked.

https://medium.com/solacedotcom/yes-you-can-run-bosh-lite-v2-on-windows-10-b55f679640b9

However, VirtualBox does not run flawlessly on WSL because it does not support run-level functionality. After many attempts, I have run out of disk space on my laptop so I decided to use VMs at the end. Maybe, some day, I will return to WSL or fully turn to linux systems since it seems to be the more feasible approach.