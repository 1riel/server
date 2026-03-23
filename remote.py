import os
import paramiko


os.system("git add .")
os.system(f'git commit -m "update"')
os.system("git push")


# Create SSH client
client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

# Connect
client.connect(
    hostname="msl-t470",
    port=22,
    username="root",
    password="asdfghjkl;'",
)  # or use pkey= for key-based auth


stdin, stdout, stderr = client.exec_command("cd /root/1riel_server && git pull && systemctl restart 1riel_server.service")
print(stdout.read().decode())

client.close()
