class PostCommentsController < ApplicationController

    def create
        book = Book.find(params[:book_id])
        comment = current_user.post_comments.new(post_comment_params)
        comment.save
        redirect_to book_path(book)
    end

    def destroy
    end

    private 

    def post_comment_params
        params.require(:post_comment).permit(:user_id,
                            :book_id,
                            :comment)
      end
end
