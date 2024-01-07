docker build --platform linux/amd64 . -t benarmstrong/cv:latest
docker push benarmstrong/cv:latest
ssh ben-docker-1 'cd benarmstro.ng; docker-compose pull cv; docker-compose up -d'
