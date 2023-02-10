FROM debian:buster

#--Get the requirements such as nginx and openssl for the container to work--#
RUN apt-get update && \
	apt-get install -y \
	nginx \
	openssl && \
	apt-get clean

#--Generate ssl key and certificate--#
RUN mkdir /etc/certs/ && \
	openssl genrsa -out /etc/ssl/private/key.pem 4096 && \
	openssl req -new -x509 -sha512 -days 3650 -key /etc/ssl/private/key.pem -out \
			/etc/ssl/certs/cert.pem -subj "/c=FT/ST=Paris/L=Paris/O=42/OU=42 Department/CN=localhost"

COPY default.conf /etc/nginx/conf.d/default.conf

#--Specify executable with flags--#
CMD ["nginx", "-g", "daemon off;"]

#--Choose our own port--#
EXPOSE 4242
