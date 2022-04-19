class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    new_post = Post.create(content: params[:content], user_id: params[:user_id])

    render json: { post: new_post }
end

  def list
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def update
    @post = Post.find(params[:id])
    @post.content=params[:content]
    @post.save
  end

end
