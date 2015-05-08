require("sinatra")
#require("sinatra/reloader")
#also_reload("lib/**/*.rb")
require("./lib/client")
require("pg")


set :bind, '0.0.0.0'
set :port, '3000'
#needed for nitrous.io to work


get("/") do
  @clients = Client.all()
  erb(:index)
end

post("/clients") do
  name = params.fetch("name")
  client = Client.new(name)
  client.save()
  erb(:success)
end