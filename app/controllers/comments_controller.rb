class CommentsController < ApplicationController
  before_action :authorize, only: [:posts, :edit, :new, :show, :secret]

  def secret
  end


  def index
  @comments = Comment.all
  end

  def show
    @comments = Comment.where(post_id: @post).order("created_at DESC")
  end


  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def edit
     @comment = Comment.find(params[:id])
     @post = @comment.post
     redirect_to edit_post_comment_path(current_user) if current_user != @comment.user
   end

  def create
    @post = Post.find(params[:post_id])
     @comment = @post.comments.new(comment_params)
     @comment.user = current_user
     if @comment.save
       redirect_to post_path(@post)
     else
       redirect_to new_post_path
     end
   end

  def update
    @comment = Comment.find(params[:id])
     @post = @comment.post
     if @comment.update_attributes(comment_params)
       redirect_to post_path(@post)
     else
       render :edit
     end
   end

  def destroy
     @comment = Comment.find(params[:id])
     @post = @comment.post
    if @comment.destroy
     redirect_to post_path(@post)
   else
     render :edit
   end


    # redirect_to posts_path
   end

  private
  def comment_params
   params.require(:comment).permit(:user_id, :post_id, :content, :anonymous)
  end



  end
