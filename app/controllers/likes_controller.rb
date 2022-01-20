class LikesController < ApplicationController

  before_action :set_post
  before_action :find_like, only: [:destroy]


  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end
  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end



  def set_post
    @post = Post.find(params[:post_id])
  end
  def already_liked?
    Like.where(user_id: current_user.id, post_id:
      params[:post_id]).exists?
  end
  def find_like
    @like = @post.likes.find(params[:id])
  end
  private

  def like_params
    params.require(:like).permit(:post_id)
  end


end
