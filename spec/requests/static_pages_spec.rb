require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1',:text =>"Sample App")
    end
  end
  describe  do
    it "should have a title 'Home'" do
      visit '/static_pages/home'
      page.should have_title("Ruby on Rails Tutorial Sample App | Home")
      #page.should has_selector("title", {:text=>"Ruby on Rails Tutorial Sample App | Home"})
    end

  end
  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1',:text =>"Help")
    end
  end
  describe  do
    it "should have a title 'Help'" do
      visit '/static_pages/help'
      page.should have_title("Ruby on Rails Tutorial Sample App | Help")
    end

  end
  describe "About page" do
    it "should have the content 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text=>"About Us")
    end
  end
  describe  do
    it "should have a title 'About Us'" do
      visit '/static_pages/about'
      page.should have_title("Ruby on Rails Tutorial Sample App | About Us")
    end

  end
  describe "Contact page"  do
    it "should have a title 'Contact Us'" do
    visit '/static_pages/contact'
    page.should have_title("Ruby on Rails Tutorial Sample App | Contact Us")
    end

  end
end
