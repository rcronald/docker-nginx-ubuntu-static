# Creating a new Docker Image with Ubuntu and Nginx

This container allows to send Environment Variables to Nginx Config.

1. docker build -t rcronald/docker-nginx-static .
2. docker run -d -it -e NGINX_PORT_X=8000 -p 8000:8000 rcronald/docker-nginx-static
3. Access to http://localhost:8000
