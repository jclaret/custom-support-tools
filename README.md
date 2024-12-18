# Custom Support Tools Container

This repository contains a `Containerfile` to build a custom container image based on `registry.redhat.io/rhel9/support-tools`. The image includes the `kernel-tools` RPM package which provides the `turbostat` command.

## Prerequisites

- [Podman](https://podman.io/) installed
- Access to [Quay.io](https://quay.io) with an account

## Steps to Build and Push the Image

### 1. Clone or Prepare the Repository
Ensure you have the following files in the same directory:
- `Containerfile` 

### 2. Build the Container Image
Run the following command to build the container image:
```bash
$ make build TAG=turbostat20230317
$ podman login quay.io/jclaret
$ make push TAG=turbostat20230317
```

### 3. Create a .toolboxrc File

```bash
$ oc debug node/sno-ctlplane-0.5g-deployment.lab
$ chroot /host
$ vi ~/.toolboxrc
REGISTRY=quay.io                
IMAGE=jclaret/custom-support-tools:turbostat20230317
TOOLBOX_NAME=custom-support-tools

# toolbox
```

Start a toolbox container using the configuration:
```
$ toolbox
$ which turbostat
/usr/bin/turbostat
# turbostat -v
turbostat version 2023.03.17 - Len Brown <lenb@kernel.org>
```
