class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # データベース側で大文字と小文字の区別ができる保証がない。
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    # formatオプションは引数に正規表現を取る
                    uniqueness: { case_sensitive: false }
                    #case_sensitiveオプションで大文字と小文字を区別するか選択。デフォルトはtrue。falseの場合区別しない
  has_secure_password
=begin
has_secure_passwordの説明
    セキュアにハッシュ化したパスワードを、データベース内のpassword_digestという属性に保存できるようになる。
    2つのペアの仮想的な属性 (passwordとpassword_confirmation) が使えるようになる。また、存在性と値が一致するかどうかのバリデーションも追加される。
    authenticateメソッドが使えるようになる (引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド) 
=end
validates :password, presence: true, length: { minimum: 6 }
=begin
has_secure_passwordメソッドは存在性のバリデーションもしてくれるのですが、これは新しくレコードが追加されたときだけに適用される性質を持っています。したがって、例えばユーザーが ’ ’ (6文字分の空白スペース) といった文字列をパスワード欄に入力して更新しようとすると、バリデーションが適用されずに更新されてしまう問題が発生してしまうのです。
=end
end
