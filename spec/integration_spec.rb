require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe("adding a new stylist", {:type => :feature}) do
  it("allows a user to add a new stylist to the database") do
    stylist = Stylist.new({:name => "Beckie Raynard", :id => nil})
    stylist.save()
    visit('/')
    fill_in('name', :with => 'Beckie Raynard')
    click_button('Add')
    expect(page).to have_content('stylist has been added!')
  end
end
  

#As a salon owner, I was to be able to view, add, update and delete clients
#As a salon owner, I was to be able to view, add, update and delete stylists
#As a salon owner, I want to be able to assign clients to a particular stylist