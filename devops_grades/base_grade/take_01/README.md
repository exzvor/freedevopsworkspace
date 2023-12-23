## Meet Gitlab
You have provided a task to upload a [project](https://github.com/exzvor/freedevopsworkspace/tree/main/app) 
consisting of a PostgreSQL database, a backend developed in Golang, and a frontend 
developed in React to a GitLab repository. Additionally, you need to deploy 
this project to a GitLab instance.

### Objectives:
1. Create gitlab-runner for `CI`.
2. Write `.gitlab-ci.yml`.
3. Make some changes in your project and assure that pipeline is succeed.

### Restrictions:
- Environment should be kept in `$env` file in Gitlab variables
- Use Docker volumes to start the Runner container

### What to learn:
- [Get started with GitLab CI/CD](https://docs.gitlab.com/ee/ci/)