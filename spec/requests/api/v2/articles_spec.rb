require 'rails_helper'

# rubocop: disable Metrics/BlockLength
RSpec.describe '/articles', type: :request do
  let(:user) { create :user }
  let(:article) { create :article, user: user }
  let(:article_two) { create :article, user: create(:user) }

  let(:valid_attributes) { attributes_for :article, user: user }
  let(:invalid_attributes) { attributes_for :invalid_article, user: user }

  let(:valid_headers) { user.create_new_auth_token }

  describe 'GET /index' do
    it 'renders a successful response' do
      get api_articles_url, headers: {}, as: :json
      expect(response).to be_successful
    end

    it 'renders two articles from distinct users' do
      article
      article_two

      get api_articles_url, headers: {}, as: :json
      expect(json_response[:articles].size).to eq 2
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_article_url(article), headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it_behaves_like "trying to access another user's resource" do
      let(:url) do
        get api_article_url(article_two), headers: valid_headers, as: :json
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        get api_article_url(article), headers: {}, as: :json
      end
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Article' do
        expect do
          post api_articles_url,
               params: { article: valid_attributes },
               headers: valid_headers,
               as: :json
        end.to change(Article, :count).by(1)
      end

      it 'renders a JSON response with the new article' do
        post api_articles_url,
             params: { article: valid_attributes },
             headers: valid_headers,
             as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Article' do
        expect do
          post api_articles_url,
               params: { article: invalid_attributes },
               headers: valid_headers,
               as: :json
        end.to change(Article, :count).by(0)
      end

      it 'renders a JSON response with errors for the new article' do
        post api_articles_url,
             params: { article: invalid_attributes },
             headers: valid_headers,
             as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        post api_articles_url,
             params: { article: valid_attributes },
             headers: {},
             as: :json
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for :article }

      it 'updates the requested article' do
        patch api_article_url(article),
              params: { article: new_attributes },
              headers: valid_headers,
              as: :json
        article.reload
        expect(article.title).to eq(new_attributes[:title])
      end

      it 'renders a JSON response with the article' do
        patch api_article_url(article),
              params: { article: new_attributes },
              headers: valid_headers,
              as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the article' do
        patch api_article_url(article),
              params: { article: invalid_attributes },
              headers: valid_headers,
              as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    it_behaves_like "trying to access another user's resource" do
      let(:url) do
        patch api_article_url(article_two), headers: valid_headers, as: :json
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        patch api_article_url(article),
              params: { article: valid_attributes },
              headers: {},
              as: :json
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested article' do
      article
      expect do
        delete api_article_url(article), headers: valid_headers, as: :json
      end.to change(Article, :count).by(-1)
    end

    it_behaves_like "trying to access another user's resource" do
      let(:url) do
        delete api_article_url(article_two), headers: valid_headers, as: :json
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        delete api_article_url(article), headers: {}, as: :json
      end
    end
  end
end
