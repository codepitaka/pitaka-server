require 'rails_helper'

RSpec.describe 'models' do
    it "create a user and a blog and connect them" do
        user = User.create(name: "test", email: "test@pitaka.com",
                           password: "1234", password_confirmation: "1234")
        expect(user.name).to eq("test")

        blog = Blog.create(title: "test blog")
        expect(blog.title).to eq("test blog")

        # enum status: {owner: 0, member: 1}
        user_blog = UserBlog.create(user_id: user.id, blog_id: blog.id, status: 0)
        expect(user_blog.status).to eq("owner")

        # check many-to-many relationship
        expect(user.blogs.first()).to eq(blog)
        expect(blog.users.first()).to eq(user)
    end

    it "create a blog, a post and a snippet and connect them" do
        blog = Blog.create(title: "test blog")
        post = Post.create(title: "test post", subtitle: "testing",
                           content: "just for testing", blog_id: blog.id)
        # check foreign key(one-to-many) relationship
        expect(post.blog.title).to eq("test blog")
        expect(blog.posts.first().title).to eq("test post")

        snippet = Snippet.create(code: "p 'test'", prog_language:"Ruby",
                                 post_id: post.id, status: 1)
        expect(snippet.post).to eq(post)
        expect(snippet.post.blog).to eq(blog)
        expect(snippet.status).to eq("executable")
    end
end
