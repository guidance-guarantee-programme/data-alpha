# Be sure to restart your server when you modify this file.

require 'jdbc/postgres'
Jdbc::Postgres.load_driver

require 'mondrian-olap'

catalog = Rails.root.join('config/mondrian.xml')
database_configuration = ActiveRecord::Base.connection_config

Rails.application.config.olap_connection = Mondrian::OLAP::Connection.create(
  driver: database_configuration[:adapter],
  host: database_configuration[:host],
  port: database_configuration[:port],
  database: database_configuration[:database],
  username: database_configuration[:username],
  password: database_configuration[:password],
  catalog: catalog
)
