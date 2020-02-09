# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# if violates validation of '/app/models/blog.rb' or '/app/models/post.rb', 'rake db:seed' won't work
blog = Blog.create(title: 'My blog')

Post.create(title: 'My first post', subtitle: 'first subtitle',
    content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    blog_id: blog.id, published: true) # blog_id should refer to id of the existing blog
Post.create(title: 'My second post', subtitle: 'second subtitle',
    content: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    blog_id: blog.id, published: true)

Post.create(title: 'My third post', subtitle: 'draft one',
    content: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
    blog_id: blog.id, published: false)
Post.create(title: 'My fourth post', subtitle: 'draft two',
    content: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    blog_id: blog.id, published: false)
