## Homework 4 

### Structure:

Project consists of two modules:
- [AWS module](https://github.com/serhiy-v/GLDevOpsBasecamp/tree/master/homework6/modules/aws)
- [Azure module](https://github.com/serhiy-v/GLDevOpsBasecamp/tree/master/homework6/modules/azure)

## Starting up

1. Clone repository

```bash
  # clone branch
  git clone git@github.com:serhiy-v/GLDevOpsBasecamp.git
```

2. Move into directory 

```bash
cd GLDevOpsBasecamp/homework6
```
3. Set up your credentials in ***providers.tf*** file

![Screenshot from 2023-01-05 22-52-02](https://user-images.githubusercontent.com/61023601/210877736-708058f2-0672-46e2-8e2c-2dcd64d2a85e.png)

4. Run commands

```bash
terraform init

terraform apply
```
As a result you'll see ip-adresses of your servers:
![Screenshot from 2023-01-05 22-39-25](https://user-images.githubusercontent.com/61023601/210877617-91d733bd-03d3-4835-a267-f73b5215c214.png)

## Result

[AWS Grafana server](http://3.88.49.178:3000/login)

[Azure Grafana server](http://20.185.148.226:3000/login)
