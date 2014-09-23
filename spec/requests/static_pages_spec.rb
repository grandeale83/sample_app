require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    
    it "should have the content 'Sample App'" do
      visit '/static_page/home'
      expect(page).to have_content('Sample App')
    end
  end
  it "should have the right title" do
    visit '/static_page/home'
    expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
  end
  
  describe "Help Page" do
    
    it "should have the content 'Help'" do
      visit '/static_page/help'
      expect(page).to have_content('Help')    
    end
  end
  it "should have the right title" do
    visit '/static_page/help'
    expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
  end
  
  describe "About page" do
    it "shold have the content 'About Us'" do
      visit '/static_page/about'
      expect(page).to have_content('About Us')
    end
  end
  it "should have the right title" do
    visit '/static_page/about'
    expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
  end
  
end
