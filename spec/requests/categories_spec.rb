require 'rails_helper'

RSpec.describe 'CategoriesController', type: :request do
  describe 'GET /index' do
    let(:user) { create(:user) } # Create a user using FactoryBot

    before(:all) do
      @category = FactoryBot.create(:category) # Create a category
      @category.user = user # Associate the category with the user
      @category.save
    end

    before(:each) { sign_in user }

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
