require 'rails_helper'

RSpec.describe 'Confirmations', type: :request do
  let(:user) { create :user }

  describe 'POST /create' do
    it 're-sends confirmation' do
      post '/api/auth/confirmation', params: { email: user.email }
      expect(response).to have_http_status(:ok)
    end
  end
end
