require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do 
    it 'should create a user' do
      @user = User.new(name: 'Bob', email: "Bobloblawslawblog@blogspot.com", password: "12345678", password_confirmation: "12345678")
      @user.save
      expect(@user.id).to be_present
    end

    it 'should not create a user when the password confirmation is different than password' do
      @user = User.new(name: 'Bob', email: "Bobloblawslawblog@blogspot.com", password: "123", password_confirmation: "12")
      @user.save
      expect(@user.errors.full_messages).to eql(["Password confirmation doesn't match Password", "Password confirmation doesn't match Password", "Password is too short (minimum is 8 characters)"])
    end

    it 'should not create a user when the password is less than 8 characters' do
      @user = User.new(name: 'Bob', email: "Bobloblawslawblog@blogspot.com", password: "123", password_confirmation: "123")
      @user.save
      expect(@user.errors.full_messages).to eql(["Password is too short (minimum is 8 characters)"])
    end

  end

  describe 'Authenticate' do
    it 'should work and not log in' do
      user = User.authenticate_with_credentials(nil, 'test')
      expect(user).to be_nil
    end
    it 'should work and log in' do
      @user = User.new(name: 'Bob', email: "Bobloblawslawblog@blogspot.com", password: "12345678", password_confirmation: "12345678")
      @user.save
      user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user).to be_present
    end
  end
end
