## Homework 4 

### Structure:

1. [Hosts](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework5/hosts) - file with hosts groups.

2. Roles:
- [Role](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework5/roles/create_file/tasks/main.yml) for creating file.
- [Role](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework5/roles/fetch_linux_distro/tasks/main.yml) for fetching linux distro information.

3. [Playbook](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework5/playbook.yml) - main file using 2 roles

To run playbook use:

```bash
ansible-playbook playbook.yml -i hosts --private-key=~/path_to_private_key
```

Result of work:

![Screenshot from 2023-01-04 20-27-54](https://user-images.githubusercontent.com/61023601/210629700-e44741e0-0c44-4b1e-ab19-03ac9feb2704.png)
