# Use the official MongoDB image
FROM mongo:latest

# Set ENV variables for MongoDB
ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=rootPassword

# Expose the default MongoDB port 
EXPOSE 27017
