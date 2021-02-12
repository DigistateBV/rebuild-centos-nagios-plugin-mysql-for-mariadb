echo "Building packages using docker... Please wait."
docker-compose up
docker-compose down
echo "Packages are ready in ./rpms/"