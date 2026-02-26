
# check ports

# [OPTIONAL] check what in port 8000
lsof -i :9999

# [OPTIONAL] kill process in port 9999
fuser -k 9999/tcp



# check
# cat /etc/systemd/system/${SERVICE_NAME}.service


########## __________ ##########



# list all user in ubuntu
cut -d: -f1 /etc/passwd
```
