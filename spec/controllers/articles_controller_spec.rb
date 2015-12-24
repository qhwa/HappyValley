require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe '#index' do

    render_views

    it 'works when no articles' do
      get :index
      expect(response).to be_success
    end

    it 'works when articles present' do
      create :article, name: 'my first article'
      get :index
      expect(response).to be_success
      expect(response.body).to include('my first article')
    end
  end

end
