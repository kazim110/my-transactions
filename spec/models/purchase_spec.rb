require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:purchase) { build(:purchase, author: user, category: category) }

  it 'is valid with valid attributes' do
    expect(purchase).to be_valid
  end

  it 'is not valid without a name' do
    purchase.name = nil
    expect(purchase).not_to be_valid
  end

  it 'is not valid without an amount' do
    purchase.amount = nil
    expect(purchase).not_to be_valid
  end

  it 'is not valid without a category' do
    purchase.category = nil
    expect(purchase).not_to be_valid
  end

  it 'is not valid without an author' do
    purchase.author = nil
    expect(purchase).not_to be_valid
  end

  it 'associated author is valid' do
    expect(purchase.author).to be_valid
  end

  it 'associated category is valid' do
    expect(purchase.category).to be_valid
  end
end
