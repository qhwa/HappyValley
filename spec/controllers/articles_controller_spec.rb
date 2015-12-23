require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe '#index' do
    it 'works when no articles' do
      get :index
      expect(response).to be_success
    end

    it 'works when articles present' do
      create :article
      get :index
      expect(response).to be_success
    end
  end

end
