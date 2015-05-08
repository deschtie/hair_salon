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
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:index)
end

post("/clients") do
  name = params.fetch("name")
  id = params.fetch("id")
  client = Client.new({:name => name, :id => id})
  client.save()
  erb(:success)
end

post("/stylists") do
  name = params.fetch("name")
  id = params.fetch("id")
  stylist = Stylist.new({:name => name, :id => id})
  stylist.save()
  erb(:success)
end