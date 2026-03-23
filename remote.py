import os
import time
import paramiko

# git commit and push
os.system("git add .")
os.system(f'git commit -m "update"')
os.system("git push")


time.sleep(10)  # delay for 10 seconds


# create SSH client
client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

# connect to the server
client.connect(
    hostname="msl-t470",
    port=22,
    username="root",
    password="asdfghjkl;'",
)  # or use pkey= for key-based auth


command = [
    "cd /root/1riel_server",
    "git pull",
    "systemctl restart 1riel_server.service",
]


stdin, stdout, stderr = client.exec_command(" && ".join(command))
print(stdout.read().decode())

client.close()
