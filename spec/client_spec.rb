require("spec_helper")

describe(Client) do
  
  describe("#==") do
    it("is the same client if they have the same name") do
      test_client_1 = Client.new({:name => "Angela Moore", :id => nil})
      test_client_2 = Client.new({:name => "Angela Moore", :id => nil})
      expect(test_client_1).to(eq(test_client_2))
    end
  end
  
  describe("#name")do 
    it("gives you the name of the client") do
      test_client = Client.new({:name => "Angela Moore", :id => nil})
      expect(test_client.name()).to(eq("Angela Moore"))
    end
  end
  
    describe("#id") do
      it("sets the ID for the client when saved") do
        client = Client.new({:name => "Angela Moore", :id => nil})
        client.save()
        expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  
  describe(".all") do
    it("is starts without any clients") do
      expect(Client.all()).to(eq([]))
    end
  end
  
  describe("#save") do
    it("add a client to the array of saved clients") do
      test_client = Client.new({:name => "Angela Moore", :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
 

  

end