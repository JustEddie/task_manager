class CommentsController < ApplicationController

    def show
    end

    def create
        @user = User.find_by(id: session[:user_id])
        @comment = @user.categories.build(comment_params)
    
        if @comment.save
          redirect_to categories_path
        else
          render root_path
        end
      end

    def update
    end

    def destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
