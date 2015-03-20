require 'spec_helper'
include ApplicationHelper
describe "User Pages" do
  subject{page}
  describe "SignUp page" do
    before{visit signup_path}
     it{should have_selector('h1', :text =>"Sign up")}
     it{should have_title(full_title('Sign up'))}
    end
end

