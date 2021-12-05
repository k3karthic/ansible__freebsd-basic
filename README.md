# Ansible — Basic Setup for FreeBSD 13

This Ansible playbook in this repository performs the following tasks on FreeBSD 13,
1. Install tmux and htop
1. Enable and configure IPFW for Fail2ban
1. Install and configure Fail2ban for the following services,
    1. SSH
    2. Shadowsocks

**Assumption:** The instances run in Google Cloud using the Terraform script below,
* terraform__gcloud-instance
    * GitHub: [github.com/k3karthic/terraform__gcloud-instance](https://github.com/k3karthic/terraform__gcloud-instance)
    * Codeberg: [codeberg.org/k3karthic/terraform__gcloud-instance](https://codeberg.org/k3karthic/terraform__gcloud-instance)

## Code Mirrors

* GitHub: [github.com/k3karthic/ansible__freebsd-basic](https://github.com/k3karthic/ansible__freebsd-basic)
* Codeberg: [codeberg.org/k3karthic/ansible__freebsd-basic](https://codeberg.org/k3karthic/ansible__freebsd-basic)

## Requirements

Install the following before running the playbook,
```
$ ansible-galaxy collection install community.general
$ pip install google-auth requests
$ ansible-galaxy collection install google.cloud
```

## Dynamic Inventory

The Google [Ansible Inventory Plugin](https://docs.ansible.com/ansible/latest/collections/google/cloud/gcp_compute_inventory.html) populates public FreeBSD instances.

All target FreeBSD instances must have the label `os: freebsd`.

## Playbook Configuration

1. Create `inventory/google.gcp_compute.yml` based on `inventory/google.gcp_compute.yml.sample`,
    1. Specify the project ID
    1. Specify the zone where you have deployed your server on Google Cloud
    1. Configure the authentication
1. Set username and SSH authentication in `inventory/group_vars/all.yml`

## Deployment

Run the playbook using the following command,
```
$ ./bin/apply.sh
```

## Encryption

Encrypt sensitive files (SSH private keys) before saving them. `.gitignore` must contain the unencrypted file paths.

Use the following command to decrypt the files after cloning the repository,

```
$ ./bin/decrypt.sh
```

Use the following command after running terraform to update the encrypted files,

```
$ ./bin/encrypt.sh <gpg key id>
```

## Acknowledgments

* Reference for fail2ban configuration [https://phrye.com/tools/fail2ban-on-freebsd/](https://phrye.com/tools/fail2ban-on-freebsd/)
