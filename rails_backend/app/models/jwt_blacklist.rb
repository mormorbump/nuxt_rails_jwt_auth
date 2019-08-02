class JwtBlacklist < ApplicationRecord
    # devise_jwtの定数を読み込み。
    # この機能をつけるためにはActiveRecordモデルかつ、 `jti`カラムを持っている必要がある。
    #  トークンが失効しているかどうかを判断するために、単にトークンが無効かどうかをチェック。
    #   失効時に、jtiカラムを使用して新しいレコードを作成。
    # これをuser.rbのjwt_revocation_strategy: JwtBlacklistでインポート。
    include Devise::JWT::RevocationStrategies::Blacklist
    # self.table_name = 'jwt_blacklists'
end
