class BlogsController < ApplicationController
    # list blogs
    def index
        # all blogs
        @blogs = Blog.all
        render "index.json"
    end
end