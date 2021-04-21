RSpec.shared_examples 'user not logged in' do
  it 'renders an unauthorized response' do
    url
    expect(response).to have_http_status(:unauthorized)
  end
end
