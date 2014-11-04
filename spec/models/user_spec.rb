require 'spec_helper'

describe User do
  
  
  before  do
    @user = User.new(name: "Alessandro Arturi", email: "a.arturi@testsampleapp.com", 
                            password: "foobar", password_confirmation: "foobar")
  end
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  #test virtual attributes for password validation
  it { should respond_to( :password ) }
  it { should respond_to( :password_confirmation ) }
  #this test the presence of authenticate method
  it { should respond_to( :authenticate ) }
  #This test the presence of the remember token
  it { should respond_to(:remember_token) }
  
  #followin check line is useless: user created as in before block has no invalid values
  it { should be_valid }
  
  #USERNAME
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when user name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  #E-MAIL
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frist.last@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
  
  describe "when an email is aldready taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email= @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
  
  describe "addresses with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }
    
    it "should be saved in mixed case" do
      @user.email = mixed_case_email
      @user.save
      expect { (@user.reload.email).to eq mixed_case_email.downcase }
    end
  end
  
  #PASSWORD
  describe "when password is not present" do
    before do
      @user = User.new(name: "nomeutente" , email: "nomeutente@email.it" , password: " " ,
            password_confirmation: " ")
    end
    
    it{ should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    
    it { should_not be_valid }
  end 
  
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) {User.find_by(email: @user.email) }
    
    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end
    
    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
    
    describe "with a password that's too short" do
      before { @user.password = @user.password_confirmation = "a" * 6 }
      it {should be_valid}
    end
  end
  
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end
