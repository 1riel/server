# Use lightweight nginx

FROM nginx:alpine

# Remove default nginx website

RUN rm -rf /usr/share/nginx/html/\*

# Copy Flutter web build

COPY build/web /usr/share/nginx/html

# Expose port 80

EXPOSE 80

# Start nginx

CMD ["nginx", "-g", "daemon off;"]

# ? python .build_web.py

frontend_product:
build:
context: .
dockerfile: Dockerfile
restart: unless-stopped
ports: - "88:80"

# Add any additional services here

# compose status

# docker compose -f docker-compose.yml ps
