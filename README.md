# Ansible - Basic Setup for Ubuntu 20.04

## Deploy for Free

You can run one server for free using the [Google Cloud Always Free](https://cloud.google.com/free) tier.

Terraform script for deploying a server in the free tier can be found at [https://github.com/k3karthic/terraform__gcloud-instance](https://github.com/k3karthic/terraform__gcloud-instance).

## Dynamic Inventory

This playbook uses the Google [Ansible Inventory Plugin](https://docs.ansible.com/ansible/latest/collections/google/cloud/gcp_compute_inventory.html) to populate public FreeBSD instances dynamically.

All public FreeBSD instances are assumed to have a label `os: freebsd`.

## Playbook Configuration

1. Create `inventory/google.gcp_compute.yml` based on `inventory/google.gcp_compute.yml.sample`
    1. specify the project id
    1. specify the zone where you have deployed your server on Google Cloud.
    1. Configure the authentication
1. Set username and ssh authentication in `inventory/group_vars/

If you are using mutliple SSH key pairs, use the following command to add them to ssh-agent before running the playbook.
```
eval "$(ssh-agent -s)"
ssh-add <path to keypair>
```

## Playbook Overview

This Ansible playbook performs the following tasks on an Ubuntu server,

1. Install tmux and htop
1. Install and configure Fail2ban for SSH

## Deployment

Run the playbook using the following command,
```
./bin/apply.sh
```

## Encryption

Sensitive files like the SSH private keys are encrypted before being stored in the repository.

You must add the unencrypted file paths to `.gitignore`.

Use the following command to decrypt the files after cloning the repository,

```
./bin/decrypt.sh
```

Use the following command after running terraform to update the encrypted files,

```
./bin/encrypt.sh <gpg key id>
```
