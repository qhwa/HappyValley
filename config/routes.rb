Rails.application.routes.draw do

  root to: 'articles#index'

  resources :articles do
    resources :article_versions, as: :versions
  end

end
