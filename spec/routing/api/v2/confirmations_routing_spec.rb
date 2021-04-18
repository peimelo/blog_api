RSpec.describe DeviseTokenAuth::ConfirmationsController, type: :controller do
  it { should route(:post, 'api/auth/confirmation').to(action: :create, format: :json) }
end
