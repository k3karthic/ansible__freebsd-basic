#!/usr/bin/env bash

ansible-lint -p site.yml roles/fail2ban roles/ipfw roles/reboot
