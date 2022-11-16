class CommentsController < ApplicationController
  def show; end

  def index
    @user = User.find_by(id: session[:user_id])
    @comments = @user.comments.all
  end

  def new
    @comment = Comment.new
  end
  def create
    @user = User.find_by(id: session[:user_id])
    @comment = @user.comments.build(comment_params)

    if @comment.save
      redirect_to categories_path
    else
      render root_path
    end
  end

  def update; end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.present?
      @comment.destroy
    end
    redirect_to root_path
    flash[:notice] = 'comment has been deleted'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
