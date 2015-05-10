require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe("adding a new stylist and then a new client", {:type => :feature}) do
  it("allows a user to add a new stylist to the database") do
    stylist = Stylist.new({:name => "Beckie Raynard", :id => nil})
    stylist.save()
    visit('/')
    fill_in('name', :with => 'Beckie Raynard')
    click_button('Add')
    click_link("Return to the homepage")
    expect(page).to(have_content("Stylist List:"))
  end
end
  



describe("adding a new client", {:type => :feature}) do
  it("allows a user to add a new stylist to the database") do
    stylist = Stylist.new({:name => "Beckie Raynard", :id => nil})
    stylist.save()
    visit('/')
    click_link("Beckie Raynard")
    fill_in('name', :with => 'Susie Reid')
    click_button("Add")
    expect(page).to(have_content("Return to the homepage"))
  end
end

