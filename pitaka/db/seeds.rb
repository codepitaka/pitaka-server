# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# if violates validation of '/app/models/blog.rb' or '/app/models/post.rb', 'rake db:seed' won't work
Blog.create(title: 'My blog')
Post.create(title: 'My first post', subtitle: "yeah!", content: "Pitaka", blog_id: 1) # blog_id should refer to id of the existing blog
Post.create(title: 'My second post', subtitle: "cheer up", content: "Tripitaka", blog_id: 1)
