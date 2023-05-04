require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  "Hello 1231!"
  @restaurants = Restaurant.all
  p @restaurants
  erb :index
end

get "/restaurants/:restaurant_id" do
  # Params is a hash where information defined as symbols from the url are accessible.
  p params
  id = params[:restaurant_id]  
  p id
  @restaurant = Restaurant.find(id)
  p @restaurant
  "TODO: restaurant page"
  erb :show
end

post "/restaurants" do
  # Here we are using the params to access the data from the form in the index.erb
  p params
  # The form has an input field called "name", which we access using params[:name]
  name = params[:name]
  # Ditto for the address.
  address = params[:address]
  r = Restaurant.create(
    name: name,
    address: address
  )
  p r
  # We want to redirect the user to the index, so they can see the restaurant has been added to the list.
  redirect "/"
end
