rm -rf factorio
scp -r -i ~/.ssh/id_rsa_factorio_do root@$ip:/opt/factorio factorio
doctl compute droplet delete factorio --force