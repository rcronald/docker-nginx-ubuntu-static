FROM ubuntu:latest

USER root

RUN apt-get update \ 
    && apt-get install -y nginx nodejs gettext-base \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
#ADD nginx.conf /etc/nginx/
ADD nginx_env.conf /etc/nginx/

ADD web /usr/share/nginx/html/
ADD web /var/www/html/

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx_env.conf

# Expose ports
EXPOSE $NGINX_PORT_X
#EXPOSE 8000

# Set the default command to execute
# when creating a new container
#CMD service nginx start
CMD /bin/bash -c "envsubst < /etc/nginx/nginx_env.conf > /etc/nginx/nginx.conf && exec nginx"
