require 'rails_helper'

RSpec.describe 'CategoriesController', type: :request do
  include Devise::Test::IntegrationHelpers # Include Devise test helpers
  describe 'GET /index' do
    before(:all) do
      @user = FactoryBot.create(:user)
      Category.destroy_all
      @category = FactoryBot.create(:category, name: 'Sample Category 1', user: @user)
      @purchase = FactoryBot.create(:purchase, category: @category)
    end

    before(:each) { sign_in @user }

    it 'returns a successful response' do
      get category_path(@category)
      expect(response).to have_http_status(200)
    end

    it 'correct template is rendered' do
      get category_path(@category)
      expect(response).to render_template(:show)
    end

    it 'includes a link to add a new purchase' do
      get category_path(@category)
      expect(response.body).to include(new_category_purchase_path(@category))
    end
  end
end
