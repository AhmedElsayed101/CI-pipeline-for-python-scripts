
## Create GitHub webhook

- Go to your remote Repositry link (https://github.com/<User_name>/<Repositry_name>)
![github-4](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/github/github-4.png)
- Click on Settings
- Click on webhooks
![github-5](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/github/github-5.png)

- Click on Add webhook
![github-6](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/github/github-6.png)

- Paste your Jenkins server IP with this format
```
http://<Jenkins server IP>:<Jenkins server port>/github-webhook/
# for example
http://54.75.50.180:8080/github-webhook/
```
![github-7](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/github/github-7.png)

- Click on (Add webhook).

- Make sure it's connected(Click on the webhook that you have just created and Click on (Recent deliveries) to Check if it's verified or not).
![github-8](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/github/github-8.png)
![github-9](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/github/github-9.png)
