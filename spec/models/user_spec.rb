require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it "does not save a user if the password and password_confirmation don't match" do
      @user = User.new(
        first_name: "Jane",
        last_name: "Doe",
        email: 'user@test.ca',
        password: 'password',
        password_confirmation: 'differentPassword'
      )
      expect(@user).to be_invalid
    end

    it "does not save a user if a password and password_confirmation aren't provided" do
      @user = User.new(
        first_name: "Jane",
        last_name: "Doe",
        email: 'user@test.ca',
        password: nil,
        password_confirmation: nil
      )
      expect(@user).to be_invalid
    end

    it "does not save a user if the provided email is already in use (case insensitive)" do
      @user1 = User.create(
        first_name: "John",
        last_name: "Doe",
        email: 'user@test.ca',
        password: "password",
        password_confirmation: "password"
      )

      @user2 = User.new(
        first_name: "Jane",
        last_name: "Doe",
        email: 'USER@TEST.ca',
        password: "password",
        password_confirmation: "password"
      )

      expect(@user1).to be_valid
      expect(@user2).to be_invalid
    end

    it "does not save a user if first name isn't provided" do
      @user = User.new(
        first_name: nil,
        last_name: "Doe",
        email: 'user@test.ca',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_invalid
    end

    it "does not save a user if last name isn't provided" do
      @user = User.new(
        first_name: 'Jane',
        last_name: nil,
        email: 'user@test.ca',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_invalid
    end

    it "does not save a user if email isn't provided" do
      @user = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_invalid
    end

    it "does not save a user if the password is less than eight characters" do
      @user = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'user@test.ca',
        password: 'pass',
        password_confirmation: 'pass'
      )
      expect(@user).to be_invalid
    end

  end

  describe '.authenticate_with_credentials' do
    
    it "returns an instance of the user if successfully authenticated" do
      @user = User.create(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'user@test.ca',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
      
      @user_authenticated = User.authenticate_with_credentials('user@test.ca', 'password')
      expect(@user).to eq(@user_authenticated)
    end
    
    it "returns false if authentication fails" do
      @user = User.create(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'user@test.ca',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
      
      @user_authenticated = User.authenticate_with_credentials('user@test.ca', 'wrongpassword')
      expect(@user_authenticated).to be_falsey
    end
    
    it "successfully authenticates if there are leading or trailing spaces around the provided email" do
      @user = User.create(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'user@test.ca',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
      
      @user_authenticated = User.authenticate_with_credentials('   user@test.ca   ', 'password')
      expect(@user).to eq(@user_authenticated)
    end
    
    it "successfully authenticates if the provided email is in wrong case" do
      @user = User.create(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'user@test.ca',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
      
      @user_authenticated = User.authenticate_with_credentials('USER@TEST.ca', 'password')
      expect(@user).to eq(@user_authenticated)
    end

  end


end
