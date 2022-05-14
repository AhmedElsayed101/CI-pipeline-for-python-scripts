## Generate ssh-key pair


- While inside the Jenkins server terminal, execute the following commands.
```sh
# Generate key
ssh-keygen -t rsa -f ./key
```
![jenkins-1](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/jenkins/jenkins-1.png)

### Add public key to github
- Copy ssh public key
```sh
# Print the public key
cat key.pub 
```
![jenkins-2](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/jenkins/jenkins-2.png)

- Copy the output.
- Add the public key(key.pub) to github ssh keys
- Go to [create ssh key github](https://github.com/settings/keys) link
![github-2](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/github/github-2.png)

- Click on (SSh and GPG keys) then click on (New SSH Key)
- Paste the private key that you copied above. 
![github-3](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/github/github-3.png)

- Click on (Add SSh key)



### Add private key to Jenkins credentials
- Copy ssh public key
```sh
# Print the private key
cat key
```
![jenkins-3](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/jenkins/jenkins-3.png)

- Copy the output.
- Add the private key(key) to Jenkins credentials
- Open jenkins dashboard
![jenkins-4](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/jenkins/jenkins-4.png)

- Click on (Manage Jenkins) then on (Manage Credentials)
![jenkins-5](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/jenkins/jenkins-5.png)

- Click on (Jenkins)
![jenkins-6](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/jenkins/jenkins-6.png)

- Click on (Add Credentials)
![jenkins-7](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/jenkins/jenkins-7.png)

- Select (SSH Username with private key) and write any (ID) and paste the private key that you copied above.
![jenkins-8](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/jenkins/jenkins-8.png)
