## Ansible Patching Playbook

### What is it for?  
Patching of Linux servers using this ansible playbook

### How to use it
There are `two` roles that you can opt to run. i.e.
- check
- patch

#### 'check':
This was designed so that guys can check access to the server that they patching.

How to run it:

`ansible-playbook -i <your inventory> ./patching/patch_master.yaml -kK -e user=<your fnum> -e role=check`

This will essentially just check if you can establish a ssh session to the server/s.

#### 'patch':
This role does the actually patching, no questions asked, so make sure you `ONLY` run this when you need to...

How to run it:

`ansible-playbook -i <your inventory> ./patching/patch_master.yaml -e user=<your fnum> -e role=patch -e expected_rhel6_kernel_version=2.6.32-754.39.1.el6 -e expected_rhel7_kernel_version=3.10.0-1160.25.1.el7 -kK`

This will patch the server/s and has a list of packages it must `exclude` when patching, you can see that list: `exclude_packages` here: `.patching/roles/patch/defaults/main.yaml`

If you believe that the `exclude_packages` needs to updated, do via submitting an MR to this repo, and inform a merge marshall to review and merge for you.

What are these variables?...
```
expected_rhel6_kernel_version
expected_rhel7_kernel_version
```

on the night of patching the satellite admins will give us the kernel versions that needs to be installed once you have `SUCCESSFULLY` patched a server/s, you put those values in, for RHEL 6 & 7, when you run the playbook, like in the example above on how to run this playbook.

The playbook will then do a check, post patching to ensure that the latest kernel is indeed installed, if not, it will also tell you that.
