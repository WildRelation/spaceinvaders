FROM nginx:alpine

COPY . /usr/share/nginx/html

RUN printf 'server {\n    listen 8080;\n    root /usr/share/nginx/html;\n    index index.html;\n    location /healthz { return 200 "ok"; add_header Content-Type text/plain; }\n    location / { try_files $uri $uri/ /index.html; }\n}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
