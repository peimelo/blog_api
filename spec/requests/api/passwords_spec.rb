require 'rails_helper'

RSpec.describe 'Passwords', type: :request do
  let(:user) { create :user }

  describe 'POST /create' do
    it 'resets password' do
      post '/api/auth/password', params: {
        email: user.email,
        redirect_url: 'http://localhost:3000/reset-password'
      }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /update' do
    it 'updates password' do
      put '/api/auth/password', params: {
        current_password: user.password,
        password: 'newpassword',
        password_confirmation: 'newpassword'
      }, headers: user.create_new_auth_token, as: :json
      user.reload
      expect(user.valid_password?('newpassword')).to be_truthy
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end
