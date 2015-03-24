require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
  before{@user=User.new(name:"Testing", email:"testing@email.com", password:"foo",password_confirmation:"foo")}

  subject{@user}

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}

  it{should be_valid}

  describe "when name is not present" do
    before{@user.name=""}
    it {should_not be_valid}
  end
  describe "when email is not present" do
    before{@user.email=""}
  it {should_not be_valid}
  end

  describe "maximum length of name" do
    before{@user.name="a" * 51}
    it{should_not be_valid}
  end
  describe "when email address is invalid" do
    it "should be invalid" do
      addresses  =%w[user@foo,com user_at_foo.org example.user@foo.
      foo@bar_baz.com foo@bar+baz.com]
      addresses.each { |invalid_address| @user.email=invalid_address
      @user.should_not be_valid}
    end

  end

  describe "when email address is valid"  do
    it "should be valid" do
      addresses  =%w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each {|valid_email| @user.email=valid_email
      @user.should be_valid}
    end

  end

  describe "when email address is already taken"  do
   before do
     user_with_same_email=@user.dup
     user_with_same_email.email=@user.email.upcase
     user_with_same_email.email.save
   end
    it {should_not be_valid}
  end
  describe "when password is not present"  do
    before{@user.password=@user.password_confirmation=" "}
    it {should_not be_valid}
  end

  describe "when passwords do not match" do
   before{@user.password_confirmation="mismatch"}
    it{should_not be_valid}
  end
  describe "when password confirmation is nil" do
  before {@user.password_confirmation=nil}
    it{should_not be_valid}
  end

  it{should respond_to(:authenticate)}

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }
    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end
    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be false }
    end
  end

end
