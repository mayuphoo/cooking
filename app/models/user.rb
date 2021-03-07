# デバイス
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article
  # ↑liked_postsによってuserがどの投稿をいいねしているのかを簡単に取得できる

  def already_liked?(article)
    likes.exists?(article_id: article.id)
  end
  # ↑ユーザーが投稿に対して、すでにいいねをしているのかどうかを判定することができるようにalready_liked?を定義
end
