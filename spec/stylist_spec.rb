require("spec_helper")

describe(Stylist) do
  
  describe("#==") do
    it("is the same stylist if they have the same name") do
      test_stylist_1 = Stylist.new({:name => "Beckie Raynard"})
      test_stylist_2 = Stylist.new({:name => "Beckie Raynard"})
      expect(test_stylist_1).to(eq(test_stylist_2))
    end
  end
  
  describe("#name")do 
    it("gives you the name of the stylist") do
      test_stylist = Stylist.new({:name => "Beckie Raynard"})
      expect(test_stylist.name()).to(eq("Beckie Raynard"))
    end
  end
  
  describe(".all") do
    it("is starts without any stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end
  
  describe("#save") do
    it("add a stylist to the array of saved stylists") do
      test_stylist = Stylist.new({:name => "Beckie Raynard"})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end
 
end