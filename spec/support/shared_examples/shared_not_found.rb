RSpec.shared_examples "trying to access another user's resource" do
  it 'renders a not found response' do
    url
    expect(response).to have_http_status(:not_found)
  end
end
