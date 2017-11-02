docker-compose build
docker-compose run --rm storeapp rails db:create
docker-compose run --rm storeapp rails db:migrate
docker-compose up