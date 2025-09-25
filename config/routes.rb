Rails.application.routes.draw do
  # Postに関するCRUDのルーティングをまとめて定義
  resources :posts

  # アプリのルートURL（/）にアクセスしたとき、記事一覧を表示
  root 'posts#index'
end