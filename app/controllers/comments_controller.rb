class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    book = Book.find_by(id: params[:book_id])
    @comment.book_id = book.id
    @comments = book.comments
    if @comment.save
      flash.now[:success] = 'Comment posted'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :rating)
  end
end
