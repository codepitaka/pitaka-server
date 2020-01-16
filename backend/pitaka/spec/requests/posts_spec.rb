# frozen_string_literal: true

# trailing '_spec.rb' of the file name is important

require 'rails_helper'

describe 'APIs related with posts', type: :request do
  it 'GET /posts/' do
    blog = Blog.create(title: 'test blog')
    Post.create(title: 'test post 1', subtitle: 'subtitle1', content: 'c1', blog_id: blog.id)
    Post.create(title: 'test post 2', subtitle: 'subtitle2', content: 'c2', blog_id: blog.id)

    get '/posts/'

    expect(response.status).to be(200)
    expect(JSON.parse(response.body)['data'].size).to eq(2)
    expect(JSON.parse(response.body)['data'][1]['title']).to eq('test post 2')
  end

  it 'GET /posts/:id' do
    blog = Blog.create(title: 'test blog')
    post = Post.create(title: 'test post 1', subtitle: 'subtitle1', content: 'c1', blog_id: blog.id)
    Post.create(title: 'test post 2', subtitle: 'subtitle2', content: 'c2', blog_id: blog.id)

    get '/posts/' + post.id.to_s

    expect(response.status).to be(200)
    expect(JSON.parse(response.body)['data']['title']).to eq(post.title)
    expect(JSON.parse(response.body)['data']['subtitle']).to eq(post.subtitle)
  end
end
