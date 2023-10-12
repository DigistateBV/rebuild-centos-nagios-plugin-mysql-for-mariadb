echo "Building packages using docker... Please wait."
docker-compose up -f 8/docker-compose.yml
docker-compose down -f 8/docker-compose.yml
echo "Packages are ready in ./rpms/"