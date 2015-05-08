class Stylist
  attr_reader(:name)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end 

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      stylists.push(Stylist.new({:name => name}))
    end
    stylists
  end
  
  define_method(:save) do
    DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}');")
  end

  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name())
  end
end