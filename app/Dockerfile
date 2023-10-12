FROM python:3.7.3-stretch

LABEL author="longhoangnguyen191@gmail.com"

# Working Directory
WORKDIR /app

# Copy all files from current directory to working dir in container
COPY . /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install  --no-cache-dir --upgrade pip && \
    pip install  --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Expose container port 80
EXPOSE 80

# Run app at container launch
CMD ["python", "app.py"]