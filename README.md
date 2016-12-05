# Installing Rocket Chat
```shell
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

sudo apt-get update

sudo apt-get install -y npm mongodb-org curl graphicsmagick

sudo npm install -g n pm2

sudo n 0.10.40

curl -L https://rocket.chat/releases/latest/download -o rocket.chat.tgz

tar zxvf rocket.chat.tgz Rocket.Chat

cd Rocket.Chat/programs/server

npm install

cd ../..

export ROOT_URL=https://localhost:3000/

export MONGO_URL=mongodb://localhost:27017/rocketchat

export PORT=3000
```

# Run MongoDB in docker
// docker should already have been installed
```shell
docker run -v "$(pwd)":/data --name mongo -p 27017:27017 -d mongo mongod --smallfiles
```

## If not, here is how to install docker on Ubuntu:
```shell
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
// For Ubuntu Xenial 16.04 (LTS)
deb https://apt.dockerproject.org/repo ubuntu-xenial main

echo "<REPO>" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-cache policy docker-engine
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install docker-engine

// you should maybe reboot your mashine
sudo service docker start
// verify that docker is running correctly 
sudo docker run hello-world
```

# Start using PM2

```shell
pm2 start main.js --name "Rocket Chat"
```
