### Homework 14

## Task1:

1. Lauched VM and configurate k8s on it:

![Screenshot from 2023-02-13 06-44-30](https://user-images.githubusercontent.com/61023601/218372606-e54841e2-5f04-4690-bd04-7ad9f57ebe9f.png)

2. Login to VM using ssh and install Helm 

```bash
sudo snap install helm --classic
```

3. Install nginx using [template](https://github.com/serhiy-v/GLDevOpsBasecamp/tree/master/homework14/nginx) and check if its installed succesfully:

```bash
helm install nginx nginx/ 
```

![image](https://user-images.githubusercontent.com/61023601/218373069-7b6cf39c-b1c6-4775-aa89-ffbd1b223b68.png)

![Screenshot from 2023-02-13 06-49-54](https://user-images.githubusercontent.com/61023601/218373269-69545c68-cc9c-4ff7-8870-3e25e13324b4.png)

[URL to see result](https://valser.dynv6.net/home)

Change amount of ReplicaSet

```bash
helm upgrade --install --atomic nginx nginx/ --set replicaCount=5
```
 Result:
 
 ![Screenshot from 2023-02-13 06-52-28](https://user-images.githubusercontent.com/61023601/218373540-482a23ad-b243-4d22-9d24-2b3907612328.png)
 
 ## Task2:
 
 1. Install pacman-game using [template](https://github.com/serhiy-v/GLDevOpsBasecamp/tree/master/homework14/pacman) and check if its installed succesfully:

```bash
helm install pacman pacman/ 
```
[URL to see result](https://valser.dynv6.net)

![Screenshot from 2023-02-13 06-56-29](https://user-images.githubusercontent.com/61023601/218373995-fa7509d8-9d41-47ed-852e-0d0134c4b4f1.png)


Result:

![image](https://user-images.githubusercontent.com/61023601/218374937-8c9074e6-96c5-492d-a6bc-1107191b6829.png)


## Task3

1. Add the repository using command :

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```
 Then run :
 
 ```bash
 helm install mern-stack bitnami/node
 ```
 ![image](https://user-images.githubusercontent.com/61023601/218375682-17b194d3-9c9f-4393-8780-f63be36d6883.png)
 
 2. Configure ingress for mern stack using this [yaml.file](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework14/ingress.yaml)
 
 ```bash
 kubectl apply -f ingress.yaml
 ```
 
 ![image](https://user-images.githubusercontent.com/61023601/218376065-f8c64330-8738-4d77-9625-36d3e127f4a5.png)
 
 [URL to see result](https://valser.dynv6.net/mernstack)
 
 Result:
 
 ![image](https://user-images.githubusercontent.com/61023601/218376272-0f7295e5-1239-4282-ac5e-499f683936d0.png)
 
 3. Final result of all pods: 
 
 ![Screenshot from 2023-02-13 07-16-18](https://user-images.githubusercontent.com/61023601/218376469-fc998223-65b5-48ee-a09d-34013d3e0c4f.png)

 
 


 

