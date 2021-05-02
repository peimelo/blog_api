require 'rails_helper'

RSpec.describe DeviseTokenAuth::PasswordsController, type: :controller do
  it { should route(:post, 'api/auth/password').to(action: :create, format: :json) }
  it { should route(:put, 'api/auth/password').to(action: :update, format: :json) }
end
