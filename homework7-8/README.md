## Homework 7-8

## Structure:

1.  Created [hosts](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework7-8/hosts) file - file with instance ip address.

2. Created 2 Roles:
- [Role](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework7-8/roles/install_pam/tasks/main.yaml) for installing pam-cracklib.
- [Role](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework7-8/roles/configure_pam/tasks/main.yaml) for configuring pam rules.

3. Created [playbook](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework7-8/playbook.yml) - main file for running 2 roles

## Starting up:

To run playbook use:

```bash
ansible-playbook playbook.yml -i hosts --private-key=~/path_to_private_key
```

Result of work:

![Screenshot from 2023-01-18 02-16-10](https://user-images.githubusercontent.com/61023601/213044965-caf77fab-9221-48d5-8f43-a93206045328.png)

Connected to instance manually, created testuser and tried to change password:

![Screenshot from 2023-01-18 02-08-21](https://user-images.githubusercontent.com/61023601/213044664-dc6949ca-5f1b-44fb-87cd-4671ee2d1e89.png)


