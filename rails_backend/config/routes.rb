Rails.application.routes.draw do
  # scopeを使うとurlだけ/api/examplesとなる。
  # format: :jsonをつけとけばデフォルトでjsonに適用
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: { sessions: 'sessions' }
    # 任意のルーティングを追加可能。as: と単数形を支持していることに注意。
    # https://matt-note.hatenadiary.jp/entry/2019/02/24/200435
    # https://www.rubydoc.info/github/plataformatec/devise/ActionDispatch%2FRouting%2FMapper:devise_scope
    devise_scope :user do
      get 'users/current', to: 'sessions#show'
    end
    resources :examples
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
