require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("adding a new stylist", {:type => :feature}) do
  it("allows a user to click a stylist to see all their clients")
  

#As a salon owner, I was to be able to view, add, update and delete clients
#As a salon owner, I was to be able to view, add, update and delete stylists
#As a salon owner, I want to be able to assign clients to a particular stylist