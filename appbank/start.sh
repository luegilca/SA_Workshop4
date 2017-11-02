docker-compose build
docker-compose run --rm bankms rails db:create
docker-compose run --rm bankms rails db:migrate
docker-compose up