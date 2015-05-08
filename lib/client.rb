class Client
  @@all_clients = []
  
  define_method(:initialize) do |name|
    @name = name
  end 
  
  define_method(:name) do
    @name
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