require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it "should validate name & email" do
      @user1 = User.new
      @user1.email = "test1@gmail.com"
      @user1.password = "12345"
      @user1.password_confirmation = "12345"
      @user1.save
      expect(@user1.errors.full_messages).to include("Name can't be blank")

      @user2 = User.new
      @user2.name = "test2"
      @user2.password = "12345"
      @user2.password_confirmation = "12345"
      @user2.save
      expect(@user2.errors.full_messages).to include("Email can't be blank")
    end
  end

  describe "password" do
    it "must be created with a password and password_confirmation" do
      @user1 = User.new
      @user1.name = "test1"
      @user1.email = "test1@gmail.com"
      @user1.password = "12345"
      @user1.password_confirmation = "12345"
      @user1.save

      expect(@user1.id).to be_present

      @user2 = User.new
      @user2.name = "test2"
      @user2.email = "test2@gmail.com"
      @user2.password_confirmation = "12345"
      @user2.save
      expect(@user2.errors.full_messages).to include("Password can't be blank")

      @user3 = User.new
      @user3.name = "test3"
      @user3.email = "test3@gmail.com"
      @user3.password_confirmation = "12345"
      @user3.save
      expect(@user3.errors.full_messages).to include("Password digest can't be blank")

    end

    it "should be created with matching password" do
      @user = User.new
      @user.name = "test"
      @user.email = "test@gmail.com"
      @user.password = "12345"
      @user.password_confirmation = "54321"
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "must have a minimum length of 5" do
      @user = User.new
      @user.name = "test"
      @user.email = "test@gmail.com"
      @user.password = "1234"
      @user.password_confirmation = "1234"
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
  end

  describe "emails" do
    it "should be created with unique email" do
      @user = User.new
      @user.name = "test"
      @user.email = "test@gmail.com"
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.save
      expect(@user).to be_present

      @user1 = User.new
      @user1.name = "test"
      @user1.email = "Test@gmail.com"
      @user1.password = "12345"
      @user1.password_confirmation = "12345"
      @user1.save
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end
  end

  describe "authenticate_with_credentials" do
    it 'should return @user with valid info' do
      user = User.new(
        name: "test",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save
      user = User.authenticate_with_credentials('test@test.com', 'password')
      expect(user).not_to be_nil
    end

    it 'should return nil with invalid info' do
      user = User.new(
        name: "test",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save
      user = User.authenticate_with_credentials('test@test.com', 'password1')
      expect(user).to be_nil
    end

    it 'should pass even with space before/after email' do
      user = User.new(
        name: "test",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save
      user = User.authenticate_with_credentials('    test@test.com  ', 'password')
      expect(user).not_to be_nil
    end

    it 'should pass even with wrong case for email' do
      user = User.new(
        name: "test",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save
      user = User.authenticate_with_credentials('TeSt@TeST.cOm', 'password')
      expect(user).not_to be_nil
    end
  end
  
end

