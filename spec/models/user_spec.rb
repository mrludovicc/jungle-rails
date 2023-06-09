require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do
        before do
        @user = User.new(
        name: 'John Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
        )
    end

    it 'should have matching password and password_confirmation fields' do
      @user.password_confirmation = 'notpassword'
      expect(@user).to_not be_valid
    end

    it 'should require password and password_confirmation fields' do
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it 'should require at least 3 characters for passwords' do
      @user.password = 'aa'
      @user.password_confirmation = 'aa'
      expect(@user).to_not be_valid
    end

    it 'should check for duplicate emails' do
      @user = User.new(
        name: 'John Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save
      @user2 = User.new(
        name: 'Jane Doe',
        email: 'TEST@TEST.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user2).to_not be_valid
    end

    it 'should return a user when given valid email with leading/trailing spaces' do
      @user.save
      authenticated_user = User.authenticate_with_credentials(" test@test.com ", "password")
      expect(authenticated_user).to eq(@user)
    end

    it 'should return a user when given a valid email with different case' do
      @user.save
      authenticated_user = User.authenticate_with_credentials("TEST@test.com", "password")
      expect(authenticated_user).to eq(@user)
    end
  end
end