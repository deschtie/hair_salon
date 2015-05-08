class Client
  @@all_clients = []
  
  attr_reader(:name)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end 

  define_singleton_method(:all) do
    @@all_clients
  end
  
  define_method(:save) do
    @@all_clients.push(self)
  end
  
  define_singleton_method(:clear) do
    @@all_clients = []
  end
  
  
end