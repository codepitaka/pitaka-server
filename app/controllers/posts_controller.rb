# frozen_string_literal: true

# actions related with Posts
class PostsController < ApplicationController
  # before_action will be triggered only before show, edit, update, destroy
  before_action :find_post, only: %i[show edit update destroy]
  # skip_before_action :verify_authenticity_token

  # list posts
  def index
    # all posts
    @posts = Post.all
    render 'index.json'
  end

  # show one post
  # 'before_action' filter will find the post with ':id'
  def show
    render 'show.json'
  end

  def new
    @post = Post.new
  end

  # create a new post
  def create
    # 'new' initializes a new instance of the model
    # 'post_params' supplies params from frontend
    @post = Post.new(post_params)
    # add blog_id to post manually
    # TODO, blog_id should be get from post_params header? or so. Not Manually like code below.
    @post.blog_id = 1
    if @post.save! # if the object get saved
      render 'create.json' # , notice: 'The new post was created.'
    else
      @post.errors.full_messages
      # render 'index.json' #, notice: 'The new post was created.'
    end
  end

  # 'before_action' filter will find the post with ':id'
  def edit; end

  # edit a post
  def update
    if @post.update(post_params)
      render 'update.json'
    else
      @post.errors.full_messages
    end
  end

  # delete a post
  def destroy
    @post.destroy
    redirect_to root_path, notice: 'The post was deleted.'
  end

  private

  # require specified params
  def post_params
    params.require(:post).permit(:title, :subtitle, :content, :published)
  end

  # extract blog id from params
  def find_post
    # @post is an instance variable (not local variable) which is available in 'views'
    @post = Post.find(params[:id])
  end
end
