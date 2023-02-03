### Homework 12

## Structure:

1. Got information about node and saved it into [file](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework12/nodeinfo.txt)
```bash
kubectl describe nodes kubeworker > nodeinfo.txt
```

2. Created namespace using [yaml file](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework12/k8s/namespace.yaml)
```bash
kubectl apply -f namespace.yaml
```
![Screenshot from 2023-02-03 20-21-13](https://user-images.githubusercontent.com/61023601/216678204-d40e8875-49c5-4875-9fb9-7118a51bb106.png)

3. Created [deployment](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework12/k8s/deployment.yaml) for 3 nginx pods. Configured [service](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework12/k8s/service.yaml) for them.
- Pods:

![Screenshot from 2023-02-03 18-34-14](https://user-images.githubusercontent.com/61023601/216678675-056065f4-6766-49d3-bc1b-5065a4aba308.png)
![Screenshot from 2023-02-03 20-27-27](https://user-images.githubusercontent.com/61023601/216679505-de168c49-b4fc-4b3a-b237-882914c629f1.png)

- Services:

![Screenshot from 2023-02-03 20-23-06](https://user-images.githubusercontent.com/61023601/216678693-49cb01f9-e6f7-4c6f-9b15-e241424fcf94.png)
![Screenshot from 2023-02-03 20-28-38](https://user-images.githubusercontent.com/61023601/216679697-231170d8-5cdc-4554-b228-4206b81c005a.png)

- Deployments:

![Screenshot from 2023-02-03 20-26-09](https://user-images.githubusercontent.com/61023601/216679282-0725da6a-173f-4645-879b-abbc32055bfc.png)

 Curl pods via [ClusterIP](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework12/k8s/service.yaml#L1-L16) and [NodePort](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework12/k8s/service.yaml#L17-L34)
 
 ![Screenshot from 2023-02-03 18-35-08](https://user-images.githubusercontent.com/61023601/216682771-52e8dc55-5607-4b16-ac11-dcdeebfe0277.png)

![Screenshot from 2023-02-03 18-39-20](https://user-images.githubusercontent.com/61023601/216682814-f0d9cd81-a02a-4999-baab-e8b2e2e468a9.png)

 
 4. Created 2 jobs:
 - [One](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework12/k8s/job1.yaml) to get content via curl from an internal port (ClusterIP)
 - [Second](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework12/k8s/job2.yaml) to get content via curl from an external port (NodePort)
 
 Result:
 
 ![Screenshot from 2023-02-03 20-35-22](https://user-images.githubusercontent.com/61023601/216681260-64468d0a-2575-45ee-b4aa-c650a3e42f15.png)

![Screenshot from 2023-02-03 20-36-11](https://user-images.githubusercontent.com/61023601/216681285-dd9f2846-5843-48af-aad1-ae626496664f.png)

![Screenshot from 2023-02-03 20-36-20](https://user-images.githubusercontent.com/61023601/216681306-3310caba-e3bf-4924-80c0-156d2f498c75.png)

![Screenshot from 2023-02-03 20-37-24](https://user-images.githubusercontent.com/61023601/216681403-5beea02f-1900-45ee-8ab0-fbf869cf5671.png)

5. Prepared [Cronjob](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework12/k8s/cronjob.yaml) test the connection to Nginx service every 3 minutes.

Result:

![Screenshot from 2023-02-03 20-40-29](https://user-images.githubusercontent.com/61023601/216681790-d5a748fa-cf90-4c0b-889b-90a08ac9f17a.png)
![Screenshot from 2023-02-03 20-42-42](https://user-images.githubusercontent.com/61023601/216682179-cbe87198-25b8-476e-83f6-834a3369a1e2.png)
![Screenshot from 2023-02-03 20-44-16](https://user-images.githubusercontent.com/61023601/216682436-8693b5fe-b04a-4510-8557-1be5b04e7a09.png)







