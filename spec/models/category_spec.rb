require 'rails_helper'

RSpec.describe Category, type: :model do
  # Assuming you have a factory for categories defined
  let(:category) { create(:category) }

  it 'can be associated with users' do
    user1 = create(:user)
    user2 = create(:user)

    category = create(:category, user: user1)
    category = Category.includes(:user).find(category.id)

    expect(category.user).to eq(user1)

    category.update(user: user2)
    category = Category.includes(:user).find(category.id)

    expect(category.user).to eq(user2)
  end

  it 'is valid with valid attributes' do
    user = create(:user) # Create a user
    category = build(:category, user: user) # Associate the category with the user
    expect(category).to be_valid
  end

  # Test for presence of name
  it 'is not valid without a name' do
    category = build(:category, name: '')
    expect(category).not_to be_valid
  end

  # Test for presence of icon
  it 'is not valid without an icon' do
    category = build(:category, icon: nil)
    expect(category).not_to be_valid
  end
end
