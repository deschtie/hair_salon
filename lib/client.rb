class Client
  attr_reader(:name, :stylist_id, :id)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name, name)
    @stylist_id = attributes.fetch(:stylist_id, stylist_id).to_i()
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
    result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id, stylist_id;")
    @id = result.first().fetch("id").to_i()
    @stylist_id = result.first().fetch("stylist_id").to_i()
  end

  
  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id()))
  end
  
  
  define_singleton_method(:find) do |id|
    found_list = nil
    Client.all().each() do |client|
      if self.id().==(@id)
        found_client = client
      end
    end
    found_client
  end

end
