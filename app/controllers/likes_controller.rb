class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(article_id: params[:article_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
# ・いいねをする→likes#create→Likeモデルにuser_idとpost_idを格納
# いいねを取り消す→likes#destroy→Likeモデルのレコードを削除する
