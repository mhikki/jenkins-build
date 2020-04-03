FROM nginx:latest
RUN sed -i 's/nginx/mhikki/g' /usr/share/nginx/html/index.html
EXPOSE 80

