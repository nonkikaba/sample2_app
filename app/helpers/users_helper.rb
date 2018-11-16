module UsersHelper
   # 引数で与えられたユーザーのGravatar画像を返す
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # MD5ハッシュでは大文字と小文字が区別されるので、Rubyのdowncaseメソッドを使って
    # hexdigestの引数を小文字に変換しています。
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
