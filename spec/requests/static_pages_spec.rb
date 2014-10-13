require 'spec_helper'

describe "Static pages" do
  
  let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  ##Test set on Home Page
  describe "Home page" do
    
    it "should have the content 'Sample App'" do
      visit '/static_page/home'
      expect(page).to have_content('Sample App')
    end
  end
  it "should have the right title" do
    visit '/static_page/home'
    expect(page).to have_title("#{base_title}")
  end
  it "should not have a custom page title" do
    visit '/static_page/home'
    expect(page).not_to have_title('| Home')
  end
  
  ##Test set on Help Page
  describe "Help Page" do
    
    it "should have the content 'Help'" do
      visit '/static_page/help'
      expect(page).to have_content('Help')    
    end
  end
  it "should have the right title" do
    visit '/static_page/help'
    expect(page).to have_title("#{base_title} | Help")
  end
  
  ##Test set on About Page
  describe "About page" do
    
    it "should have the content 'About Us'" do
      visit '/static_page/about'
      expect(page).to have_content('About Us')
    end
  end
  it "should have the right title" do
    visit '/static_page/about'
    expect(page).to have_title("#{base_title} | About")
  end
  
  ##Test set on Contats Page
  describe "Contacts page" do
    
    it "should have the content 'Contacts'" do
      visit '/static_page/contact'
      expect(page).to have_content('Contacts')
    end
  end
  it "should have the right title" do
    visit '/static_page/contact'
    expect(page).to have_title("#{base_title} | Contacts")
  end
  
end
