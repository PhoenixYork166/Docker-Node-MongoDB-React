# Understanding Data
##
## 1. Application
## [Code + Environment]
## Written & provided by you (the developer)
## Added to image & container in Build phase
## "Fixed" code: Cannot be changed once image is built
##
## We have to rebuild our docker image using 
## docker build -t berlinleephoenix/ourImage -f ./Dockerfile
##
## Hence, code inside a docker image = Read-only
##
## 2. Temporary App Data 
## e.g. entered user input
## Fetched / Produced in running containers
## Stored in memory / temporary files
## Dynamic & changing but cleared regularly 
## once we shut down our containers
## Read + Write,
## temporary, hence stored in Containers
##
## Container Layer 3: Image Layer 3 (Read + Write)
## Container Layer 2: Image Layer 2
## Container Layer 1: Image Layer 1
##
## 3. Permanent App Data
## e.g. User Accounts
## Fetched / Produced in running containers
## Stored in files or a Database
## Must NOT be lost if a container stops / restarts
## Read + Write,
## Permanent, stored with Containers & Volumes
##
## A file with new contents will be stored temporarily in temp
## server.js checks whether this temp file is stored in feedback folder
##
## Build Image
## cd managingData/data-volumes-
## docker build -t feedback-node -f ./Dockerfile .
##
## Run our newly created docker image feedback-node in:
## -p = localPort:containerPort => 3002:3002
## -d = detach mode
## --name = naming our new container called feedback-app 
## --rm = remove our container upon stopping our container named feedback-app
## to be built using docker image feedback-node
##
## docker run -p 3002:3002 -d --name feedback-app --rm feedback-node;
##
## Check running containers
## docker ps -a;
## 
## Looking at code in server.js
## Once we 'Save' a Feedback that saved 
## Title: testing
## Document Text: testing
## We can browse it using localhost:3002/feedback/testing.txt
##
## Containers have no connections with our host machine
## once we docker run our container using a docker image
##
## Stopping a container Will NOT remove the files saved in it
## Removing a container will remove the files saved in it
##
## We will LOSE the files saved in localhost:3002/feedback/testing.txt
## once we remove that particular docker container feedback-app
## 
## Any new files are only stored in that particular container
## New Files will NOT be saved into the Read-only docker image
##
# Solutions
## Volumes = Storing persistent data
## Volumes = Folders on our host machine hard drive
## which are mounted ("mode available", mapped) into containers
##
## Volumes = persistent even if a container is shut down
##
## A Container can Write data into a Volume (on our host) and
## Read data from a Volume (on our host)

