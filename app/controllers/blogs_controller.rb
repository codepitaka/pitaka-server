# frozen_string_literal: true

# actions related with Blogs
class BlogsController < ApplicationController
  # list blogs
  def index
    # all blogs
    @blogs = Blog.all
    render 'index.json'
  end
end
