#!/bin/bash
imageName=my_image
containerName=my_container

sudo docker build -t $imageName .

echo Run new container \(-rf\)
sudo docker run --env NGINX_AUTOINDEX=true -ti -p 80:80 -p 443:443 --name $containerName $imageName 
