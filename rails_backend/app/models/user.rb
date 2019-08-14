class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
         # jwt_revocation_strategy: JwtBlacklist はモデル名を指してる。

  # トークンがユーザーに発信されると、そのjti要求は関連付けられたテーブルに格納されます。
  # 認証のたびに、着信トークンjtiはjtiそのユーザーに関連付けられているすべてのトークンと照合されます。認証は、どちらかが一致した場合にのみ成功します。
  # サインアウトすると、トークンjtiは関連付けられたテーブルから削除されます。
end
