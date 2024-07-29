# Ansible Roles for HPE OneView Tasks

## Roles:
- **set_ov_config**:<br>
  Set's a temp config file used while accessing OneView.
- **cleanup_ov_config**:<br>
  Cleans up the temp OneView config file, this role is set to ALWAYS run at the end of the playbook run.
- **hardware**:<br>
  Used for adding in physical servers to HPE OneView.<br>
  It has multiple tasks that are triggered depending on what variables are set, either manually when initially running the playbook, or dynamically depending on the status of objects in OneView.
- **profiles**:<br>
  Used for adding in / applying server profiles to physical servers.<br>
  It also has multiple tasks that are triggered depending on what variables are set, , either manually when initially running the playbook, or dynamically depending on the status of objects in OneView.
- **labels**:<br>
  Shows the labels defined in OneView, can be expanding upon later if needed.
- **sessions**:<br>
  Tasks to login and logout of OneView

## How to use it
When you want to add new server hardware to OneView, use the below suggested command:

`ansible-playbook ./main.yaml -t hardware -e cci_cluster=w01-rtm2 -e status_check=true -e add_hardware_if_missing=true`

Command parameters explained:
- "*-t hardware*":<br>
  This tells the ansible playbook that we are using the `'hardware'` tag which is mapped to the role: `hardware`.
- "*-e cci_cluster=w01-rtm2*":<br>
  This parses in a variable of `cci_cluster` with value: `w01-rtm2` which is looked up against the `oneview_data.yaml` in hash: `cci_hpe_servers`, so the playbook now is run against servers defined in that hash with key: `w01-rtm2`.<br>
  So we only targetting a sepcific cluster, in this example: `w01-rtm2`.
- "*-e status_check=true*":<br>
  This will show you the status of the servers (hardware) defined in hash: `cci_hpe_servers` with key: `w01-rtm2`.
- "*-e add_hardware_if_missing=true*":<br>
  setting this key to `true` will trigger the playbook to auto add server hardware to OneView as well apply their specific server profiles.<br>
  It also check and set's the iLO hostname if necessary.

There are also some nice rescue blocks that will attempt to re-apply a service profile if the first attempt failed (this is common for HPE servers it seems).
