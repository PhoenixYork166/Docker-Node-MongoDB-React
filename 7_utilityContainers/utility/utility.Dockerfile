# Extra slim Node image
FROM node:14-alpine

WORKDIR /app

# Give user full control of this image
#CMD npm init

# CMD [] vs ENTRYPOINT []
# CMD []
# docker command overrides CMD [] in Dockerfile
# docker run -it -v $(pwd):/app containerName <command> 

# ENTRYPOINT []
# we can append any npm commands
ENTRYPOINT [ "npm" ]