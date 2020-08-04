class PostsController < ApplicationController
  def index
    # @post = Post.find(1)
    @posts = Post.all.order("created_at DESC")
  end

  def create
      post = Post.create(content: params[:content], checked: false)
      render json:{post: post}
  end

  def checked
    post = Post.find(params[:id])
    if post.checked then
      # もともと既読の場合は未読にする
      post.update(checked: false)
    else
      # もともと未読の場合は既読にする
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: {post: item}
  end
end
