require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get users_path
    end

    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'Should Render the all user list' do
      expect(response.body).to include('Here is a list of users')
    end

    it 'Render correct placeholder text' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get user_path(id: 1)
    end

    it 'returns http success success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      expect(response).to render_template(:show)
    end

    it 'Render correct placeholder text' do
      expect(response.body).to include('Here is a specific user')
    end
  end
end
