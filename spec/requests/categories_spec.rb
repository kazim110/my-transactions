require 'rails_helper'

RSpec.describe 'CategoriesController', type: :request do
  include Devise::Test::IntegrationHelpers # Include Devise test helpers
  describe 'GET /index' do
    before(:all) do
      @user = FactoryBot.create(:user)
      @category = FactoryBot.create(:category, name: 'Sample Category 1', user: @user)
    end

    before(:each) { sign_in @user }

    it 'returns a successful response' do
      get categories_path
      expect(response).to have_http_status(200)
    end

    it 'correct template is rendered' do
      get categories_path
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text' do
      get categories_path
      expect(response.body).to include('Categories')
    end
  end
end
