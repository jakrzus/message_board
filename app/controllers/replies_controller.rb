class RepliesController < ApplicationController
  before_action :set_post, only: [:new, :index, :create]
  before_filter :authenticate_user!
  def index
    @replies = @post.replies
  end

  def new
    @reply = Reply.new
  end

  def create
    @reply = @post.replies.new(reply_params)
    @reply.user = current_user

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @post, notice: 'Reply was successfully saved' }
        format.json { render json: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: 'Wrong entry' }
    end
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:comment, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
