### Homework 10

## Task 1

### Structure:

1. Created [Dockerfile](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework10/task1/Dockerfile) with httpd server

2. Build it 
```bash
 docker build . -t test-site
```

![Screenshot from 2023-01-27 03-46-39](https://user-images.githubusercontent.com/61023601/215000482-e21e7e83-b930-4de9-827d-ec8bbf15e21e.png)

3. Run created image 
```bash
docker run --name docker-test-site -d -p 8080:80 test-site
```
![Screenshot from 2023-01-27 03-57-34](https://user-images.githubusercontent.com/61023601/215000627-aa3fc999-c75d-451a-9261-275de5930d33.png)

4. Check site availability

![Screenshot from 2023-01-27 03-57-12](https://user-images.githubusercontent.com/61023601/215000724-1260b0a4-8278-45f8-8ea8-c95e0b5bbf0a.png)

## Task 2

### Structure:

1. Created [Dockerfile](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework10/task2/Dockerfile) with ping utill

2. Build Dockerfile
```bash
 docker build . -t test-pinger
```
3. Create 2 networks
```bash
 docker network create public-ntwrk 
 docker network create private-ntwrk --internal
```

4. Run comtainers
```bash
docker run --name public -d --network public-ntwrk  test-pinger sleep 600 
docker run --name private -d --network private-ntwrk  test-pinger sleep 600 
```

5. Connect private network to public container  
```bash
docker network connect private-ntwrk public
```

Result of network inspect:

![Screenshot from 2023-01-27 04-47-51](https://user-images.githubusercontent.com/61023601/215001757-eeaaeb70-bab1-482b-b6c4-7f26c8378b82.png)

![Screenshot from 2023-01-27 04-48-03](https://user-images.githubusercontent.com/61023601/215001772-0cb8a04c-8a08-4522-9b60-23ab3d8f8905.png)

## Result:

Public:

![Screenshot from 2023-01-27 04-38-56](https://user-images.githubusercontent.com/61023601/215001855-11876d95-c967-48c4-a38d-1162e193aea0.png)

Private:

![Screenshot from 2023-01-27 04-44-29](https://user-images.githubusercontent.com/61023601/215001863-21fe810a-c472-42f6-a35c-52a332c250bc.png)





