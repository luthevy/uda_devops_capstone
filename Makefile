# Create and activate a Python virtual environment
setup:
	python3 -m venv ~/.udacity_capstone
	source ~/.udacity_capstone/bin/activate

# Install project dependencies from requirements.txt
install:
	echo "Installing: dependencies..."
	pip install --upgrade pip &&\
	    pip install -r app/requirements.txt
	echo "Installing: hadolint..."
	./bin/install_hadolint.sh
	echo
	echo "Installing: kubectl"
	./bin/install_kubectl.sh
	echo
	echo "Installing: eksctl"
	./bin/install_eksctl.sh

lint:
	# Lint Dockerfile using hadolint
	./bin/hadolint app/Dockerfile
	# Lint Python source code using pylint
	# Note: This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app/app.py

# Run the application (app.py)	
run-app:
	python3 app/app.py

# Build the Docker image for the application
build-docker:
	./bin/build_docker.sh

# Build and run the Docker container
run-docker: build-docker
	./bin/run_docker.sh
	
# Upload the Docker image to a repository (presumably Docker Hub)
upload-docker: build-docker
	./bin/upload_docker.sh
	
# Create an EKS cluster (Amazon Elastic Kubernetes Service)
eks-create-cluster:
	./bin/eks_create_cluster.sh	
