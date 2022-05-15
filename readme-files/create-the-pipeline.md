
## Create the pipeline

- Go to your Jenkins dashboard and click on (New Item)
![pipeline-1](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-1.png)

- Select (Pipeline) and add a name then press (OK)
![pipeline-3](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-3.png)

- Check (GitHub hook trigger for GITScm polling)
![pipeline-4](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-4.png)

- Select Pipeline script from SCM
![pipeline-5](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-5.png)

- Select (Git) SCM
![pipeline-6](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-6.png)

- Add your ssh remote repositry url
- Go to to your Repositry link
- Click on Clone
- Select ssh and copy the link
![pipeline-8](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-8.png)

- Go back to Jenkins and paste the Link
![pipeline-9](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-9.png)

- Select the ssh Credintial that we have created to remove the error.
![pipeline-10](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-10.png)

- Change branch to (*/main) or leave it blank.
![pipeline-11](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-11.png)

- Make sure that Script Path is (Jenkins)
- Click on Save button.
![pipeline-12](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-12.png)

- You can commit any changes and push the code. The pipeline will run automagically (automatically).
![pipeline-15](https://github.com/AhmedElsayed1011/python-pipeline-images/blob/main/pipeline/pipeline-15.png)
