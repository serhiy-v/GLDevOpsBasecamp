### Homework 9 

## Structure:

**[Script](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework9/install-jenkins.sh) for automatic install of Jenkins and user configuration**

1. Created AWS EC2 instance and install Jenkins on it:

![Screenshot from 2023-01-26 21-07-53](https://user-images.githubusercontent.com/61023601/214927180-e627440d-3434-4292-9ac1-1007974f3506.png)

2. Created 2 scripts:
- [Script](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework9/install-script.sh) for creating Apache2 server
- [Script](https://github.com/serhiy-v/GLDevOpsBasecamp/blob/master/homework9/test-script.sh) for testing server

3. Created Jenkins Multibranch Pipeline:

![Screenshot from 2023-01-26 21-12-11](https://user-images.githubusercontent.com/61023601/214927949-422b360b-afbc-4e2d-b0eb-9509cf7593e6.png)

![Screenshot from 2023-01-26 21-11-50](https://user-images.githubusercontent.com/61023601/214927984-47d9ffc3-efff-4107-9951-d72baf299859.png)

4. Added Webhook to start pipeline automatically:

![Screenshot from 2023-01-26 21-13-52](https://user-images.githubusercontent.com/61023601/214928299-72ff9209-9a7f-4e92-96d7-d3274dd2b3fe.png)

5. Created TelegramBot to send notification about pipeline results:

![Screenshot from 2023-01-26 21-20-14](https://user-images.githubusercontent.com/61023601/214929655-ae057f02-117f-4bec-acf3-a1fa7650ff8e.png)

## Result

- Master branch:

![Screenshot from 2023-01-26 21-17-12](https://user-images.githubusercontent.com/61023601/214929127-530e1078-8779-4e09-baa1-4a062bb068f1.png)

- Test Branch:

![Screenshot from 2023-01-26 21-17-28](https://user-images.githubusercontent.com/61023601/214929181-4c6c2b6c-b231-4dbe-8a25-9c758598b1cf.png)

- PR branch:

![Screenshot from 2023-01-26 21-17-54](https://user-images.githubusercontent.com/61023601/214929237-641d0b3a-ce1d-42a8-ae2a-5426d5c837bb.png)

- Site: 

![image](https://user-images.githubusercontent.com/61023601/214929393-9e487197-2c91-461c-9c48-65b939c8a664.png)
