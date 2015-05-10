require("sinatra")
#require("sinatra/reloader")
#also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")


set :bind, '0.0.0.0'
set :port, '3000'
#needed for nitrous.io to work

DB = PG.connect({:dbname => "hair_salon_test"})


get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  erb(:stylist_success)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post("/clients") do
  name = params.fetch("name")
  client = Client.new({:name => name, :stylist_id => nil, :id => nil})
  client.save()
  erb(:client_success)
end

get("/clients/:id") do
  @client = Client.find(params.fetch("id").to_id())
  erb(:client)
end