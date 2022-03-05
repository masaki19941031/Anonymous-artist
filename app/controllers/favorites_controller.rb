class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_image

  def create
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    # redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    # redirect_to post_image_path(post_image)
  end

  private

  def set_post_image
    @post_image = PostImage.find(params[:post_image_id])
  end
end