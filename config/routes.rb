Rails.application.routes.draw do
  get 'article_versions/index'

  get 'article_versions/show'

  root to: 'articles#index'

  resources :articles do
    resources :article_versions, as: :versions
  end

end
