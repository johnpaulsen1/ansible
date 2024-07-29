# README - TMC Deploy  
## Managed, maintained by and primarily developed by I&SS iDigiTech - Midrange Linux.

See related [git wiki](https://git.fnb.co.za/tsd-linux/private-wiki/-/tree/master/team_projects/flask/TMC)

## How to?
These Ansible Playbooks are used primarily for the installation and management of the TMC Daemon.

### Steps:
1. Clone [this repo](https://git.fnb.co.za/tsd-linux/ansible-playbooks/-/archive/master/ansible-playbooks-master).
2. From within in the `ansible-playbooks` directory, populate your inventory file with the host/s you want to deploy to.
3. Populate `./tmc_deployment/inventory/inventory.ini` with all the host names of the server/s you are deploying TMC to.
4. change directory `cd` into the `tmc_deployment` directory from the git repo that you cloned in step 1.
5. Run the below command to execute the master playbook, to begin the TMC install:

  `ansible-playbook -i ./inventories/inventory.ini ./tmc_daemon.yaml -t deploy -e user=fxxxxxxx -kK`

  Where `user=fxxxxxxx` is your f employee number / user you want to run the playbook with.

## Feature requests, bugs, issues ... ?
Please do log issues, bug reports, feature requests on the project page on [our git server](https://git.fnb.co.za/tsd-linux/ansible-playbooks).

## License and copyright
See [LICENSE](https://git.fnb.co.za/tsd-linux/puppet-main/blob/production/LICENSE).

Copyright - FNB, I&SS iDigiTech, Midrange Linux
