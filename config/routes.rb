Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 投稿記事の一覧が表示できる機能
  root to: 'articles#index'
  resources :articles
end
