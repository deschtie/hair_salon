require("spec_helper")


describe(Stylist) do
    
  describe(".all") do
    it("is starts without any stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end
  
   describe("#name")do 
    it("gives you the name of the stylist") do
      test_stylist = Stylist.new({:name => "Beckie Raynard", :id => nil})
      expect(test_stylist.name()).to(eq("Beckie Raynard"))
    end
  end
  
  describe("#id") do
    it("sets the ID for the stylist when saved") do
      stylist = Stylist.new({:name => "Beckie Raynard", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you add a stylist to the database") do
      test_stylist = Stylist.new({:name => "Beckie Raynard", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end
 
  describe("#==") do
    it("is the same stylist if they have the same name") do
      test_stylist_1 = Stylist.new({:name => "Beckie Raynard", :id => nil})
      test_stylist_2 = Stylist.new({:name => "Beckie Raynard", :id => nil})
      expect(test_stylist_1).to(eq(test_stylist_2))
    end
  end
  
  describe("#clients") do
    it('returns an array of clients for the particular stylist') do
      test_stylist = Stylist.new({:name => "Beckie Raynard", :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Catie Cacciatore", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client_2 = Client.new({:name => "Catie Cacciatore", :stylist_id => test_stylist.id()})
      test_client_2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client_2]))
    end
  end
  
end