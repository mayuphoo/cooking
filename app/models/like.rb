class Like < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates_uniqueness_of :article_id, scope: :user_id
  # validates_uniqueness_ofによって、post_idとuser_idの組が1組しかないようにバリデーションをかける
end
