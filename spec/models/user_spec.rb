require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = ''
    expect(user).not_to be_valid
  end

  # Additional tests for email and password if they are required fields
  it 'is not valid without an email' do
    user.email = ''
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user.password = ''
    expect(user).not_to be_valid
  end
end
