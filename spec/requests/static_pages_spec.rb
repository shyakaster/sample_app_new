require 'spec_helper'
include ApplicationHelper
describe "StaticPages" do
    subject{page}
    shared_examples_for "all static pages" do
      it{should have_selector('h1', text: heading)}
      it{should have_title(full_title(page_title))}
    end
  describe "Home page" do
    before{visit root_path}
    let(:heading){'Sample App'}
    let(:page_title){''}
    alias_it_should_behave_like "all static pages"
    it {should_not have_title("| Home")}
  end
  describe "Help page" do
    before{visit help_path}
    let(:heading){'Help'}
    let(:page_title){'Help'}
    alias_it_should_behave_like_to "all static pages"

  end

  describe "About page" do
    before{visit about_path}
    let(:heading){'About Us'}
    let(:page_title){'About Us'}
    alias_it_should_behave_like_to "all static pages"
  end
  describe "Contact page"  do
    before{visit contact_path}
    let(:heading){'Contact Us'}
    let(:page_title){'Contact Us'}
    alias_it_should_behave_like_to "all static pages"

  end
    it "should have the right links on the layout" do
      visit root path
      click_link "About"
      page.should have_title full_title('About Us')
      click_link "Help"
      page.should have_title full_title('Help')
      click link "Contact"
      page.should have_title full_title('Contact Us')
      click link "Home"
      click link "Sign up now!"
      page.should have_title full_title('Sign Up')
      click link "sample app"
      page.should have_title  full_title('')
    end
end

