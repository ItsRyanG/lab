# Group Management Role

This role creates groups as defined in the `managed_groups` list. Each group can optionally have a `gid` assigned.

## Example Usage

In your playbook, you can include the role like this:

```yaml
- hosts: all
  become: yes
  roles:
    - group_management
