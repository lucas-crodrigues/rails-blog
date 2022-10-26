require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:all) do
      get user_posts_path(user_id: 1)
    end

    it 'returns http success' do
      get '/users/show/posts/'
      puts response
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    before(:each) do
      get user_post_path(user_id: 1, id: 1)
    end

    it 'returns http success' do
      get '/users/show/posts/show'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      expect(response).to render_template(:show)
    end

    it 'Render correct placeholder text' do
      expect(response.body).to include('Here is a specific post for specific user')
    end
  end
end
