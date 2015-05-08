require("sinatra")
#require("sinatra/reloader")
#also_reload("lib/**/*.rb")
require("./lib/client")
require("pg")


set :bind, '0.0.0.0'
set :port, '3000'
#needed for nitrous.io to work

DB = PG.connect({:dbname => "hair_salon_test"})


get("/") do
  erb(:index)
end

get('/client_main')do
  @clients = Client.all()
  erb(:client_index)
end

get('/stylist_main')do
  @stylists = Stylist.all()
  erb(:stylist_index)
end

get("/clients/new") do
  erb(:client_form)
end

post("/clients") do
  name = params.fetch("name")
  client = Client.new({:name => name})
  client.save()
  erb(:client_success)
end

post("/stylists") do
  name = params.fetch("name")
  id = params.fetch("id")
  stylist = Stylist.new({:name => name, :id => id})
  stylist.save()
  erb(:success)
end