class Client
  attr_reader(:name, :stylist_id, :id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name, name)
    @stylist_id = attributes.fetch(:stylist_id, stylist_id)
    @id = attributes.fetch(:id, id).to_i()
  end 

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      id = client.fetch("id").to_i()
      clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    clients
  end
  
define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id()))
  end
  
  
 define_singleton_method(:find) do |id|
    search_client = nil
    Client.all().each() do |client|
      if client.id().==(id)
        search_client = client
      end
    end
    search_client
  end


end