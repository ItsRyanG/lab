## Simple User Creation Role

This role:
- Creates users
- Adds SSH public keys to `~/.ssh/autorized_keys`
- Grants passwordless sudo privileges, if set to ture.
- Adds user to list of groups.


### Vars:
```yaml
---
users:
  - name: alice
    ssh_key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7examplekeyAlice"
    sudo: true
    groups: "wheel"
    shell: /bin/bash

  - name: bob
    ssh_key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD8examplekeyBob"
    sudo: false
    shell: /bin/bash

  - name: charlie
    ssh_key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDuexamplekeyCharlie"
    sudo: true
    groups: "admin"
    shell: /bin/zsh
```

### Playbook:
```yaml
---
- name: Manage Users on All Hosts
  hosts: all
  become: yes
  roles:
    - user_management
```