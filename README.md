# README

# おっきい流れ

rails: database.ymlをdocker用に書き直す

nuxt: package.jsonで、HOSTを0.0.0.0にして、どっからでもバインドできるようにする。

rails: データを用意。何らかのコントローラでjsonに変換。

rails: rails db:migrate

rails: ルーティングもデフォルトのフォーマットがjsonになるように変更。scopeでapiになるように区切る。必要あればv1とかも。

rails: ApplicationコントローラでMimeRespondsクラスをinclude。全てのレスポンスがjsonになるようオーバーライド(これ、devise入れてからじゃないと動かない。)

nuxt: yarn add @nuxtjs/axios @nuxtjs/vuetify (axiosだけでいいかも)

nuxt: nuxt.config.jsにインポートしたモジュール、そしてaxiosのデフォルトのリクエスト先を定義。

nuxt: 適当にviewかく。default.vueとか

nuxt: mounted()テンプレートの初期化時に呼び出すupdateExamplesメソッドをAjaxで定義。もちろん行き先はrailsのルーティングによる。表示したいデータがあるパスを指定。

rails: gem rails-corsをインストールして、application.rbでCORS(Cross-Origin Resource Sharing)の設定。これをしないとnuxt側からrailsのドメインへのリクエストが許可されない。

rails: deviseとdevise-jwtをインストール

rails: Userモデルと、トークンの失効を扱えるJwtBlacklistモデルを作成。カラムはjtiとexp。どっちも名称必須。null: falseでtimestampを削除、jtiにindexを貼ることも注意。

rails: include Devise::JWT::RevocationStrategies::Blacklistを追加し、トークンを失効していた時に再生成する機能を追加。

rails: jwt認証のためのシークレットキーをbin/rails secretで作成。

rails: EDITOR="vim" rails credentials:editで、先ほど生成したsecretキーをjwt_secret: に代入。

rails: devise.rbでシークレットキーjwt_secretを読み込む記述を追加。

rails: Userモデルに、:jwt_authenticatableの利用と、JwtBkacklistモデルをjwt_revocation_strategyに読み込ませる記述を追加。

rails: 忘れずにdevise_forもscope: apiの中にネスト。

rails: users/sessions_controllerを作成。もちろんルーティングも変更。

rails: jbuilderをインストール。https://qiita.com/ryouzi/items/06cb0d4aa7b6527b3645

rails: sessions_controllerのcreateをオーバーライド。request.envでリクエストヘッダにある'warden-jwt_auth.token'を渡すようにし、jbuilderでjson化。

nuxt: 認証機能も追加。 yarn add @nuxtjs/auth

nuxt: modulesに追加と、endpointsも追加。strategiesとlocalで括らないとうまくいかないので注意。

nuxt: store/index.jsでstateの初期化。

nuxt: ログインページの実装。ページ名がURLとなる。









This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
