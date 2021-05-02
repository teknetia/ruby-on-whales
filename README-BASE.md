# Ruby on Whales

Mostly adapted from [https://docs.docker.com/samples/rails/](https://docs.docker.com/samples/rails/) with some tweaks.

## Copying this repo

`git clone git@github.com:teknetia/ruby-on-whales.git app-name`

## Make commands

I am lazy so I created a bunch of make commands to reduce how much typing I need to do when I want to do basic stuff.

**Getting started**
- `make new` will build the containers and create a new rails app and force the database to be postgres
  - Don't forget to configure the database connection in `config/database.yml` after the app is generated
  - The default database password is `password` and is in the `docker-compose.yml` file, not a sensible place for it to be. This should be properly managed along with other secrets
- `make db-create` will run `docker-compose run app rails db:create` and get your basic database ready to go

To start a new project:
1. `make new` to build the containers and create a new rails app
2. Edit the database config file (`config/database.yml`) so your app knows how to connect to the db container
3. `make db-create` to get a basic DB ready
4. `make up` to start your app

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
```

**General commands**
- `make up` is the usual way to start the app
- `make down` is the usual way to stop the app
- `make migrate` will run your database migrations
- `make build` will run `docker-compose build`
- `make rebuild` will run `make install && make build`
- `make shell` will give you a shall in the app container
- `make test` will execure rspec
- `make reset` will kill it all and recreate it

## Accessing the app

Once built and running your app will be available at [http://localhost:3000](http://localhost:3000)