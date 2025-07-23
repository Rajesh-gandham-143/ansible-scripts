CW-Suite ERP Deployment Using Ansible
This repository contains Ansible playbooks and variable files to set up and deploy the CW-Suite ERP Project.

The setup process automates:

✅ Cloning required Git repositories

✅ Configuring domains and SSL certificates

✅ Setting up PostgreSQL database

✅ Preparing Docker containers

✅ Running services inside Docker


1️⃣ Prerequisites
Before running the script, ensure you have:

Ubuntu server or local machine

**Ansible installed**
```bash

sudo apt update && sudo apt install ansible -y
```
**Git installed**
```bash

sudo apt install git -y
```
Access to GitLab or GitHub with a valid token

PostgreSQL installed if you want to restore the database locally



2️⃣ Variables to Configure
The main configuration is inside the vars/ folder. You need to update the following files:

🔹 vars/projects.yml
| Variable                                         | Description |
|------------------                                |-------------|
| **user**                                         | The Linux user who runs the script (e.g., `ubuntu` on server, or your local user). |
| **base_domain**                                  | Base domain for your deployment (e.g., `erp.example.com`). |
| **main_domain**                                  | Full main domain used by the ERP (e.g., `example.com`). |
| **certbot_email**                                | Email for SSL certificate registration. |
| **docker_name**                                  | Used for Docker container name, image name, and Docker network. |
| **db_name / db_user / db_password / db_port**    | Database configuration. |
| **ansible_project**                              | Path where the script should run (e.g., `/home/ubuntu/ansible-project`). |
| **templates**                                    | Path for Ansible templates. |
| **repos**                                        | Path where all Git repos will be cloned. |
| **composefile**                                  | Path where Docker-related files (docker-compose.yml, properties) will be stored. |
| **gitlab_url**                                   | URL of GitLab or GitHub repo. |
| **gitlab_token**                                 | Your personal access token for GitLab/GitHub. |
| **gitlab_title**                                 | A unique title for the SSH key (different for every new server). |
| **frontend**                                     | List of frontend services with container port mappings. |
| **git_repos**                                    | List of all repo URLs and branches. |


ℹ️ NOTE: In git_repos, update branch names and repo URLs as needed.

🔹 vars/compose-vars.yml
This file contains Docker-specific variables such as:

1. Docker image versions

2. Ports for backend/frontend

3. Additional service configurations


3️⃣ Steps to Deploy
**Clone this repository**
```bash

git clone <your-ansible-repo-url>
cd ansible-project

```
**Edit the variable files**
```bash

nano vars/projects.yml
nano vars/compose-vars.yml
```

**Run the playbook**
```bash
ansible-playbook -i hosts.ini site.yml
```

The script will:

1. Configure Nginx with SSL

2. Set up PostgreSQL database

3. Clone required Git repos

4. Build Docker images and start containers

**Notes**
1. Make sure you have valid SSH keys for GitLab/GitHub access

2. Always generate a new GitLab/GitHub token for each deployment

3. Avoid committing any secrets (tokens/passwords) to the repository

