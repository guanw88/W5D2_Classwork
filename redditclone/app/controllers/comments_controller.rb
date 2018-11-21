class CommentsController < ApplicationController
  def new
    @post = Post.find_by(id: params[:post_id])
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id

    if @comment.save
      if is_parent_comment?(@comment)
        redirect_to post_url(@comment.post)
      else
        redirect_to comment_url(@comment.parent_comment)
      end
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_post_comment_url(@comment.post)
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render :show
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

  def is_parent_comment?(comment)
    comment.parent_comment_id.nil?
  end
end
