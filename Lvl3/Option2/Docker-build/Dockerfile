FROM ubuntu:16.04
 RUN apt-get -y update
 RUN apt-get -y upgrade
 RUN apt-get install -y nginx
 RUN apt-get install -y vim wget curl net-tools
 RUN rm -rf /var/www/html/*
 RUN ls 
 ADD index.html /var/www/html
 EXPOSE 80
 CMD ["nginx", "-g", "daemon off;"]

