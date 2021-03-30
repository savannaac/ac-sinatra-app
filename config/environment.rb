ENV['SINATRA_ENV'] ||= "development"

require "bundler/setup"
Bundler.require(:default, ENV['SINATRA_ENV'])

set :database, { :adapter =>'sqlite3', :database =>'friendcrossing.db' }

require "./app/controllers/application_controller"
require_all "app"
