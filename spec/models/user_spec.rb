require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do

    it 'should be created when password and confirmation fields match and all info filled' do
      user = User.create!(name: 'Connor', email: 'connor@aol.gov', password: 'abc123', password_confirmation: 'abc123')
    end

    it 'requires password and confirmation fields to exist' do
      user = User.create(name: 'Connor', email: 'connor@aol.gov')
      expect(user).to_not be_valid
    end

    it 'requires matching password and confirmation' do
      user = User.create(name: 'Connor', email: 'connor@aol.gov', password: 'abc321', password_confirmation: 'abc123')
      expect(user).to_not be_valid
    end

    it 'requires email' do
      user = User.create(name: 'Connor', email: '', password: 'abc123', password_confirmation: 'abc123')
      expect(user).to_not be_valid
    end

    it 'requires name' do
      user = User.create(name: '', email: 'connor@aol.gov', password: 'abc123', password_confirmation: 'abc123')
      expect(user).to_not be_valid
    end

    it 'requires unique email' do
      user1 = User.create(name: 'Connor', email: 'connor@aol.gov', password: 'abc123', password_confirmation: 'abc123')
      user2 = User.create(name: 'Connor', email: 'connor@aol.gov', password: 'abc123', password_confirmation: 'abc123')
      expect(user1).to be_valid
      expect(user2).to_not be_valid
    end

    it 'requires unique email, cant get past by using caps' do
      user1 = User.create(name: 'Connor', email: 'connor@aol.gov', password: 'abc123', password_confirmation: 'abc123')
      user2 = User.create(name: 'Connor', email: 'CONNOR@aol.gov', password: 'abc123', password_confirmation: 'abc123')
      expect(user1).to be_valid
      expect(user2).to_not be_valid
    end

  end

  describe 'password minimum length' do
    it 'requires password at least length of 5 characters' do
      user = User.create(name: 'Connor', email: 'connor@aol.gov', password: '1234', password_confirmation: '1234')
      expect(user).to_not be_valid
    end
  end

end
