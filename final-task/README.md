# Final task
 
 To start up this project you need to have [Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform) and [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed.

## Terraform


 Clone repository:

```bash
  # clone branch
  git clone git@github.com:serhiy-v/GLDevOpsBasecamp.git
```

Move into directory:

```bash
cd GLDevOpsBasecamp/final-task/terraform
```
 Set up your credentials in ***providers.tf*** file

![Screenshot from 2023-02-23 00-47-28](https://user-images.githubusercontent.com/61023601/220777722-10007cfa-1de3-4c14-850a-9d89469f4575.png)

 Run commands:

```bash
terraform init

terraform apply
```
As a result you'll see ip-adresses of your instances:

![Screenshot from 2023-02-23 01-25-31](https://user-images.githubusercontent.com/61023601/220786533-67a6279b-3877-404b-aab7-caa5c3746ace.png)


Also can see result of Ansible Hardening:

![Screenshot from 2023-02-23 01-15-11](https://user-images.githubusercontent.com/61023601/220785065-bc5bfc43-43d4-4535-9a1d-2eb894a8b6d6.png)


## Kubespray

Clone Kubespray:
```bash
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
git checkout release-2.20
```

Copy and edit inventory file
```bash
cp -rfp inventory/sample inventory/mycluster
nano inventory/mycluster/inventory.ini
```
```bash
[all]
node1 ansible_host=<VM_external_ip>

[kube_control_plane]
node1

[etcd]
node1

[kube_node]
node1

[calico_rr]

[k8s_cluster:children]
kube_control_plane
kube_node
calico_rr

```
 
Turn on MentalLB

```bash
nano inventory/mycluster/group_vars/k8s_cluster/addons.yml
```
```bash
…
metallb_enabled: true

metallb_speaker_enabled: true

metallb_avoid_buggy_ips: true

metallb_ip_range:
  - "VM_private_adress/32"

…
```

Turn on proxy strict arp

```bash
nano inventory\mycluster\group_vars\k8s_cluster\k8s-cluster.yml
```
```bash
…

kube_proxy_strict_arp: true

…
```

Run execute container
```bash
docker run --rm -it -v /mnt/path/to/kubespray/:/mnt \
  -v /path/to/ssh/keys/:/pem \
  quay.io/kubespray/kubespray:v2.20.0 bash
```
Go to kubespray folder and start ansible-playbook. It can take some time for kubespray to deploy cluster.

```bash
cd /mnt/kubespray
```

```bash
ansible-playbook -i inventory/mycluster/inventory.ini --private-key /pem/id_rsa -e ansible_user=remote_user -b  cluster.yml
```

Output:

![Screenshot from 2023-02-23 01-52-56](https://user-images.githubusercontent.com/61023601/220790511-c0c49817-3c26-47be-a727-7353705b9338.png)



## Kubernetes

Move into Ansible directory:

```bash
cd ansible
```

Run command:

```bash
ansible-playbook deploy-playbook.yaml -i hosts -e "host=<vm_external_ip> user=<db-user> password=<db-password> ip=<db-ip> db=<db-name>"
```
Output:

![Screenshot from 2023-02-23 01-59-14](https://user-images.githubusercontent.com/61023601/220791292-ce26b589-b1f8-45dc-9e64-ae30404fb258.png)

Change DNS ip-adress:

![Screenshot from 2023-02-23 02-00-20](https://user-images.githubusercontent.com/61023601/220791442-8af91e0b-24a0-4e5c-af91-9ce75a33adec.png)


## Results

### Wordpress:

[URL](https://valser.dynv6.net/) for site

![Screenshot from 2023-02-23 02-04-25](https://user-images.githubusercontent.com/61023601/220792251-96cde44c-f45f-46c2-8806-89fa2de018c9.png)

![Screenshot from 2023-02-23 02-05-44](https://user-images.githubusercontent.com/61023601/220792418-b37f4548-cc8e-4aa9-9b34-9182c5caa6e8.png)

![Screenshot from 2023-02-23 02-06-09](https://user-images.githubusercontent.com/61023601/220792449-1d844f20-5178-43ac-bb39-589bd311ad22.png)

### Hardening:

Before:

![Screenshot from 2023-02-23 01-46-52](https://user-images.githubusercontent.com/61023601/220789339-8168d9e2-08c1-442e-ab1e-19d5038be7cd.png)


After:

![Screenshot from 2023-02-23 01-46-13](https://user-images.githubusercontent.com/61023601/220789242-64aa1eda-dc2c-4942-a380-df2af2228c18.png)

