require("spec_helper")

describe(Client) do
  
  describe(".all") do
    it("is starts without any clients") do
      expect(Client.all()).to(eq([]))
    end
  end
  
  describe("#save") do
    it("add a client to the array of saved clients") do
      test_client = Client.new({:name => "Angela Moore", :id => 1, :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
  
  describe("#==") do
    it("is the same client if they have the same name and stylist id") do
      test_client_1 = Client.new({:name => "Angela Moore", :id => 2, :stylist_id => 1})
      test_client_2 = Client.new({:name => "Angela Moore", :id => 1, :stylist_id => 1})
      expect(test_client_1).to(eq(test_client_2))
    end
  end
  
  describe("#name")do 
    it("gives you the name of the client") do
      test_client = Client.new({:name => "Angela Moore", :id => 1, :stylist_id => nil})
      expect(test_client.name()).to(eq("Angela Moore"))
    end
  end
   describe("#styist_id") do
    it("lets you read the stylist id out") do
    test_client = Client.new({:name => "Angela Moore", :id => 1, :stylist_id => 1})
    expect(test_client.stylist_id()).to(eq(1))
    end
  end
 
  

end