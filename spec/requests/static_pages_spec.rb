require 'spec_helper'

describe "StaticPages" do
  let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1',:text =>"Sample App")
    end
    it "should have a title 'Home'" do
      visit '/static_pages/home'
      page.should have_title("#{base_title}")
      #page.should has_selector("title", {:text=>"Ruby on Rails Tutorial Sample App | Home"})
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_title("| Home")
    end
  end
  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1',:text =>"Help")
    end
    it "should have a title 'Help'" do
      visit '/static_pages/help'
      page.should have_title("#{base_title} | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text=>"About Us")
    end
    it "should have a title 'About Us'" do
      visit '/static_pages/about'
      page.should have_title("#{base_title} | About Us")
    end
  end
  describe "Contact page"  do
    it "should have a title 'Contact Us'" do
    visit '/static_pages/contact'
    page.should have_title("#{base_title} | Contact")
    end
    it "should have content 'Contact Us'" do
      visit '/static_pages/contact'
      page.should have_selector('h1',:text =>"Contact Us")
    end
  end
end
