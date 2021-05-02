require 'rails_helper'

RSpec.describe DeviseTokenAuth::TokenValidationsController, type: :controller do
  it { should route(:get, 'api/auth/validate_token').to(action: :validate_token) }
end
