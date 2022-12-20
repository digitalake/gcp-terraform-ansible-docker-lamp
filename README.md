# GCP-Terraform-Ansible-Docker-LAMP
### [Web-server ip](http://34.116.154.153:80) 
### Overal info ###
Hi there!
In this repo u can find my solution to deploy web-server-db-satak using interesting tools:
- Terraform
  - providers:
    - google
    - null_resource
    - templates
- Ansible 
- Docker/Docker-compose

### Main principal ###

The repo provides Main terraform code which creates hosts file for ansible and then executes Ansible command

So, in details, it works like this:

- Terraform:
  - creates infrastructure:
    - network
    - subnet
    - firewall rules for ingress
    - main e2-virtual machine
  - additionally:
    - generates file from template for executing Ansible
    - executes ansible via local_exec
    
- Ansible:
  - does server management
    - installing docker + docker-compose plugin
    - configuring group for docker users
    - transporting docker-compose + required files to remote host
    - executes docker-compose remotely
    
- Docker:
  - is used with docker-compose.yml for fast and officient deployments
  - runs docker containers connected with each other via composefile
  
### Notes ###
- Important:
  - Terraform:
    - Credentials:
      - dont use hardcoded account credentials in your TF code
      - use both variables.tf + teraform.tfvars files to provide additional security to sensetive data
      - use.gitignore while pushing to public repos
      - use gcloud CLI to get .json file with credentials for using in provider section as a path
    - Relations 
      - while using this code, pay attention to use your own paths
      - create own variable values
  - Ansible:
    - make sure terraform generetes hosts file in right repo
    - make sure "Host checking" option is disabled for ansible to be executable via automated tools without additional args
      - you can use environment variable
      - you can use ansible configs
    - make sure python is installed on the remote host
  - Docker:
    - use .env file to store docker-compose.yml credentials and sensetive data
    - make sure ports ure using are free
    
    
### Useful links ###
[Learn about Docker-compose](https://docs.docker.com/compose/)

[Learn about Terraform for GCP](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

[Ansible Docs](https://docs.ansible.com/)

[GCP concepts](https://cloud.google.com/docs)
    
      
      
      
      



