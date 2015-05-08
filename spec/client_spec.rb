require('rspec')
require('client')


describe(Client) do
  before() do
    Client.clear()
  end
  
  describe("n")
  
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end
  
  describe("#save") do
    it("add a client to the array of saved clients") do
      test_client = Client.new("Angela Moore")
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
  
  describe(".clear") do
    it("empties out all of the saved clients") do
      Client.new("Angela Moore").save()
      Client.clear()
      expect(Client.all).to(eq([]))
    end
  end


end