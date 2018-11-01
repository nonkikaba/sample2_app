class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # データベース側で大文字と小文字の区別ができる保証がない。
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    # formatオプションは引数に正規表現を取る
                    uniqueness: { case_sensitive: false }
end