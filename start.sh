echo "Make sure you've got a ssh key called 'factorio' on DO that resides in ~/.ssh/id_rsa_factorio_do locally"

ssh_fingerprint=$(doctl compute ssh-key list | awk '$2 == "factorio" {print $3}')
ip=$(doctl compute droplet create factorio --image 72401866 --region fra1 --size s-4vcpu-8gb-intel --tag-name factorio --ssh-keys $ssh_fingerprint --wait | tail +2)

ssh -i ~/.ssh/id_rsa_factorio_do root@$ip "mkdir /opt/factorio && chown 845:845 /opt/factorio"
scp -r -i ~/.ssh/id_rsa_factorio_do factorio root@$ip:/opt/factorio