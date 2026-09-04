FROM nginx:alpine

LABEL org.opencontainers.image.title="Kisan Market"
LABEL org.opencontainers.image.description="Static Kisan Market frontend"

RUN rm -rf /usr/share/nginx/html/*

COPY frontend/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
