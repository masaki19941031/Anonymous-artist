class PostImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @post_image = PostImage.new
  end

  def index
    @post_images = PostImage.page(params[:page]).per(12).order("created_at DESC") # 現状12枚表示
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      flash[:notice] = "投稿完了！"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:title, :body, :image)
  end
end