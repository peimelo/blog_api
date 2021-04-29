require 'rails_helper'

RSpec.describe Article, type: :model do
  subject(:article) { build :article }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }

    it { should validate_length_of(:title).is_at_least(3) }

    it { should validate_uniqueness_of(:title).case_insensitive }
  end

  describe 'concerns' do
    it '.sorted' do
      expect(Article.order('body desc').to_sql).to eq Article.sorted('body', 'desc').to_sql
      expect(Article.order('title asc').to_sql).to eq Article.sorted('x', 'x').to_sql
    end
  end
end
