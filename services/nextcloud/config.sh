docker exec -it nextcloud bash


php occ config:system:set trusted_domains 0 --value=msl-t470
php occ config:system:set trusted_domains 1 --value=ftp.muysengly.com
php occ config:system:set overwrite.cli.url --value=https://ftp.muysengly.com


# php occ config:system:get overwrite.cli.url
# php occ config:system:get trusted_domains