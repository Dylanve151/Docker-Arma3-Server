Use docker compose and attach to the updategame container to login.

restart the updatemods container after you've login on the updategame container.

once updategame container is done restart the webadmin container.

 
Might need to manually build the updatemods image.

### Sources

For webadmin: https://github.com/Dahlgren/arma-server-web-admin
For steamcmd: https://hub.docker.com/r/cm2network/steamcmd


### ISSUES

Not starting mission. Server error: Player without identity *****

Not sure why. cant fix it...
