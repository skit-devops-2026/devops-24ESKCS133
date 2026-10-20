
FROM nginx:alpine

LABEL org.opencontainers.image.title="Kisan Market"
LABEL org.opencontainers.image.description="Static Kisan Market frontend"

RUN rm -rf /usr/share/nginx/html/*

COPY index.html style.css front1.html front1.css script.js script1.js /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
