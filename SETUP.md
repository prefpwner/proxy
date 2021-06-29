1. create digital ocean droplet
2. run `ubuntu-server-setup` script
    - apt upgrade && apt update
    - harden SSH
    - create user `vpnproxy`
    - install zsh
3. clone `proxy` repo
4. update `.env.example`
5. build proxy image from Dockerfile `sudo docker image build --tag proxy .`
6. run `sudo docker-compose --env-file .env up -d`
7. update ufw `sudo ufw allow proto tcp from any to any port 8844,8845`