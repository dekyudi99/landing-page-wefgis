FROM nginx:alpine

# Menyalin konfigurasi custom Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Menyalin seluruh file website ke direktori root Nginx
COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
