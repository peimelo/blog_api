require 'rails_helper'

RSpec.describe DeviseTokenAuth::SessionsController, type: :controller do
  it { should route(:post, 'api/auth/sign_in').to(action: :create, format: :json) }
  it { should route(:delete, 'api/auth/sign_out').to(action: :destroy, format: :json) }
end
