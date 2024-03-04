#Crud com elixir

first [install erlang](https://www.erlang.org/downloads.html) and [Elixir](https://elixir-lang.org/install.html) 

PostgreSql is required

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`





## Stack utilizada

Elixir

Phoenix

Ecto

PostgreSQL




## Features

- Create
- Read all products
- Read one product by id


## Endpoits

get "/products" return all products in database

get "/products/id" find one product by id

post "/products" creates and saves a product in the database


Post data structure:

{"product":{
	"name": "ProductName",
	"price": ProductPrice
}}




Use Insomnia or Postman to Test
