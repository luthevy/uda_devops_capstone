# UDACITY CLOUD DEVOPS ENGINEERING: CAPSTONE PROJECT

## Project Rubrics:
✔️ Create Github repository to store my work \
✔️ Use Image repository to store Docker images \
✔️ Build a Docker container in a pipeline. \
✔️ Build and push Docker Image to Docker hub. \
✔️ Execute linting step in executing pipeline. \
✔️ The Docker container is deployed to a Kubernetes cluster. \
✔️ Use Blue/Green Deployment.
 
## Project Coding Environment Setting:
I used AWS Cloud9 to code and control project version, CircleCI to automate the process:
- Step 1: Set up CircleCI environment parameters: AWS credentials and Docker hub credentials.
- Step 2: In AWS IAM, create new user and a new key-pair in region US-WEST-2 (EKS cluster can't be created with another region).
- Step 3: In AWS Cloud9, when choosing EC2 instance (newly-created), choose type **t3.small** for sufficient memory.
- Step 4: Setup Python virtual environment before working.

## Project Running Steps:
- Step 1: Configure AWS access credentials (newly-created user)
- Step 2: Check if eksctl installed, if not, follow this link to install: https://eksctl.io/installation/
- Step 3: Check if kubectl installed, if not, install with following commands: 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
- Step 4: Run `eksctl create cluster --config-file=./infra/create_eks_cluster.yml`
- Step 5: CircleCI running
- Step 6: Check Load Balancer in EC2 to open flask app