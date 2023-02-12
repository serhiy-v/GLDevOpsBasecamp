### Homework 13

## Task1:

Create instance and add ssh key to it:

![Screenshot from 2023-02-12 02-36-56](https://user-images.githubusercontent.com/61023601/218294476-431e5ac9-b282-4e84-9f8d-49d1a60afce3.png)

![Screenshot from 2023-02-12 02-37-28](https://user-images.githubusercontent.com/61023601/218294480-ac99adb0-9c9b-46db-b262-0d28dc800e55.png)

Test connection using ssh:

![Screenshot from 2023-02-12 02-55-34](https://user-images.githubusercontent.com/61023601/218294596-65e38839-51c2-43ea-ba6a-29b63d767881.png)

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
![Screenshot from 2023-02-12 02-59-54](https://user-images.githubusercontent.com/61023601/218294697-8088014c-60ec-499d-bbce-bd6e86abe8ec.png)
 
Turn on MentalLB

```bash
nano inventory\mycluster\group_vars\k8s_cluster\addons.yml
```
…
metallb_enabled: true

metallb_speaker_enabled: true

metallb_avoid_buggy_ips: true

metallb_ip_range:
  - "VM_private_adress/32"

…

```bash
nano inventory\mycluster\group_vars\k8s_cluster\k8s-cluster.yml
```
…

kube_proxy_strict_arp: true

…

Run execute container
```bash
docker run --rm -it -v /mnt/path/to/kubespray/:/mnt \
  -v /path/to/ssh/keys/:/pem \
  quay.io/kubespray/kubespray:v2.20.0 bash
```
Go to kubespray folder and start ansible-playbook

```bash
cd /mnt/kubespray
```

```bash
ansible-playbook -i inventory/mycluster/inventory.ini --private-key /pem/id_rsa -e ansible_user=remote_user -b  cluster.yml
```

Result:

![Screenshot from 2023-02-12 04-31-28](https://user-images.githubusercontent.com/61023601/218294935-a75dcdf8-ad8c-4b2a-a505-cf4b97cfb244.png)



Connected to VM and get nodes:

```bash
mkdir ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chmod 777 ~/.kube/config
kubectl get nodes
```

![Screenshot from 2023-02-12 04-34-07](https://user-images.githubusercontent.com/61023601/218294957-2ddbdc42-bf32-4a94-96de-e16ec165cdf4.png)

## Task2

Install Ingress-controller

```bash
kubectl apply -f nginx-ctl.yaml
kubectl apple -f path_provisioner.yml
```

```bash
kubectl get pods -n ingress-nginx -w
```

![Screenshot from 2023-02-12 06-55-55](https://user-images.githubusercontent.com/61023601/218295046-18bdd6ad-56aa-49b1-afd7-badd136af6ce.png)

## Task3

Prepare domain 

![Screenshot from 2023-02-12 04-27-47](https://user-images.githubusercontent.com/61023601/218295067-0ce1f314-8fe0-455b-a2da-995660276f72.png)

Deploy cert-manager:

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml
```

![Screenshot from 2023-02-12 04-49-28](https://user-images.githubusercontent.com/61023601/218295097-a7896c0f-4cfe-4b65-863b-e6a238fbb035.png)


Deploy issuer

```bash
kubectl apply -f clusterIssuer.yaml
```

![Screenshot from 2023-02-12 04-51-58](https://user-images.githubusercontent.com/61023601/218295124-02894542-a30f-4b35-ae01-392754661fa6.png)

### Task4

Prepared [deployment](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework13/deployment.yaml) with nginx ingress, service and deployment

![Screenshot from 2023-02-12 04-58-36](https://user-images.githubusercontent.com/61023601/218295282-06b47f92-4e38-4fc5-bc0a-7de6f49521a5.png)

And go to site using followng domain

Result:

![Screenshot from 2023-02-12 07-09-17](https://user-images.githubusercontent.com/61023601/218295241-7fbfd0bc-02c7-4663-a66a-b3b4cc6b7ee5.png)









