require 'rails_helper'

RSpec.describe Api::V2::ArticlesController, type: :controller do
  it { should use_before_action(:authenticate_api_user!) }
end
