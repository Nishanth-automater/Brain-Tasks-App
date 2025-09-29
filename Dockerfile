# source image
FROM nginx:alpine

# removing default files
RUN rm -rf /usr/share/nginx/html/*

# copying source code to image
COPY dist/ /usr/share/nginx/html/

# changing nginx default config
RUN sed -i 's/listen       80;/listen       3000;/' /etc/nginx/conf.d/default.conf

# deafult port
EXPOSE 3000

# starting nginx
CMD  ["nginx", "-g", "daemon off;"]
