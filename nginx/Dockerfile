FROM nginx
COPY html /usr/share/nginx/html
COPY ssl/selfsigned.key /etc/nginx/conf.d/devdockerCA.key
COPY ssl/selfsigned.crt /etc/nginx/conf.d/devdockerCA.crt

COPY nginx.conf /etc/nginx/

