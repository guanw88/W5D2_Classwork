class PostsController < ApplicationController
  before_action :redirect_if_not_author, only: [:edit, :update, :destroy]
  before_action :redirect_if_not_logged_in


  def new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @all_comments = @post.comments.includes(:author)
    render :show
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def redirect_if_not_author
    post = Post.find_by(id: params[:id])
    unless post.author_id == current_user.id
      flash[:errors] = ['Insufficient permission to make change']
      redirect_to post_url(post)
    end
  end

end
