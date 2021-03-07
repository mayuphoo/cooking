class Article < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :title, presence: true
  validates :body, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  # liked_usersによって投稿が誰にいいねされているのかを簡単に取得できる
  has_many_attached :images

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とtitleの部分一致を表示(部分一致の曖昧検索)。
    else
      all #全て表示させる
   end
end

end
