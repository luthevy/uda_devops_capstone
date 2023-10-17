FROM python:3.7.3-stretch

LABEL author="luthevy2001@gmail.com"

WORKDIR /app

COPY . /app/

# Install dependencies from requirements.txt
RUN pip install  --no-cache-dir --upgrade pip && \
    pip install  --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Open to port 80
EXPOSE 80

CMD ["python", "app.py"]