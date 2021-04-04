#!/bin/bash
imageName=my_image
containerName=my_container

sudo docker build -t $imageName .

echo Run new container \(-rf\)
sudo docker run -d -p 8090:80 --rm --name $containerName $imageName
