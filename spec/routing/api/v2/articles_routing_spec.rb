require 'rails_helper'

RSpec.describe Api::V2::ArticlesController, type: :routing do
  describe 'routing' do
    it { should route(:get, 'api/articles').to(action: :index, format: :json) }
    it { should route(:get, 'api/articles/1').to(action: :show, id: '1', format: :json) }
    it { should route(:post, 'api/articles').to(action: :create, format: :json) }
    it { should route(:put, 'api/articles/1').to(action: :update, id: '1', format: :json) }
    it { should route(:patch, 'api/articles/1').to(action: :update, id: '1', format: :json) }
    it { should route(:delete, 'api/articles/1').to(action: :destroy, id: '1', format: :json) }
  end
end
