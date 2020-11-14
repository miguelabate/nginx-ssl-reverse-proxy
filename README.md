#Self signed certs
First need to generate the self signed certificates using the helper script generateSelfSignedCerts.sh

This is based on the complete explanation provided in https://www.humankode.com/ssl/create-a-selfsigned-certificate-for-nginx-in-5-minutes

#Start up 
Start the echo service and the reverse proxy using docker compose using start.sh

Note: the nginx container uses "network_mode: "host"". In this mode the container shares the networking namespace of the host, directly exposing it to the outside world.
This allows referencing localhost directly from nginx.conf file.

#Trust the certificate in chrome (optional)
certutil -d sql:$HOME/.pki/nssdb -A -t "P,," -n "localhost" -i localhost.crt

#Alternative qithout docker compose

Echo service:
 docker run -ti --rm -p 8080:5050 vad1mo/hello-world-rest

Run nginx reverse proxy:
docker run -v ./html:/usr/share/nginx/html:ro -v ./nginx:/etc/nginx:ro -v ./ssl:/etc/ssl:ro  -p 80:80 -p 443:443 -p 8081:8081 nginx

#Try the echo service
https://localhost/echo/dfds

#Try the static web server
https://localhost/
