module UsersHelper
   # 引数で与えられたユーザーのGravatar画像を返す
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # MD5ハッシュでは大文字と小文字が区別されるので、Rubyのdowncaseメソッドを使って
    # hexdigestの引数を小文字に変換しています。
    # 本チュートリアルでは、リスト 6.32のコールバック処理で小文字変換されたメールアドレス
    # を利用しているため、ここで小文字変換を入れなくても結果は同じです。ただし、
    # 将来gravatar_forメソッドが別の場所から呼びだされる可能性を考えると、
    # ここで小文字変換を入れることには意義があります。
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
