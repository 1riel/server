docker pull nginx:alpine

# create nginx configuration
cat <<EOF | tee /etc/nginx/conf.d/1riel.conf > /dev/null
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:8000;
    }
}
EOF