build:
	docker-compose build

new:
	make build && docker-compose run --no-deps app rails new . --force --database=postgresql && make rebuild

install:
	docker-compose run app bundle install && yarn install

rebuild:
	make install && make build

up:
	docker-compose up

down:
	docker-compose down

shell:
	docker-compose exec app bash

test:
	docker-compose run app bundle exec rspec

db-create:
	docker-compose run app rails db:create

migrate:
	docker-compose run app rails db:migrate

reset:
	docker-compose run app rails db:reset