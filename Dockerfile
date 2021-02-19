#Dockerfile
FROM python:3.5.3

#Install NGINX
RUN apt-get update && apt-get install nginx -y --no-install-recommends && apt-get install curl -y && apt-get install iputils-ping -y && apt-get install nmap -y
COPY nginx.default /etc/nginx/sites-available/default

RUN mkdir /VulnerableWebApp
COPY . /VulnerableWebApp
 
WORKDIR /VulnerableWebApp/VulnerableWebApp

RUN pip install -r requirements.txt
RUN chmod +x ./startup.sh

EXPOSE 8080
CMD ["./startup.sh"]
