require 'rails_helper'

RSpec.describe ArticleVersionsController, type: :controller do

  let!(:article) { create :article }

  describe "GET #index" do
    it "returns http success" do
      get :index, article_id: article.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, article_id: article.id, id: article.versions.first.id
      expect(response).to have_http_status(:success)
    end
  end

end
