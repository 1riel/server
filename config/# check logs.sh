
# check logs

SERVICE_NAME=gtr_backend
systemctl restart ${SERVICE_NAME}.service
journalctl -u ${SERVICE_NAME} -f -o short-iso

# Live logs
SERVICE_NAME=gtr_backend
journalctl -u ${SERVICE_NAME} -f

# Today only
SERVICE_NAME=gtr_backend
journalctl -u ${SERVICE_NAME} --since today

# Last 100 lines
SERVICE_NAME=gtr_backend
journalctl -u ${SERVICE_NAME} -n 100

# With ISO timestamps
SERVICE_NAME=gtr_backend
journalctl -u ${SERVICE_NAME} -o short-iso


# save log to file
WORKING_DIR=/root/gtr_app
mkdir -p ${WORKING_DIR}/logs
touch ${WORKING_DIR}/logs/service.log
journalctl -u ${SERVICE_NAME} -n 10000 -o short-iso > ${WORKING_DIR}/logs/service.log
# journalctl -u ${SERVICE_NAME} -o short-iso > ${WORKING_DIR}/logs/service.log
