require 'rails_helper'

describe User do

  before do
    @user = User.new(email: "qweqwe@gmail.com", password: "qweqwe")
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(email: "qweqwe@gmail.com", password: " ")
    end
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" }
    it { should be_invalid }
  end

end
