# frozen_string_literal: true

# trailing '_spec.rb' of the file name is important

require 'rails_helper'

describe '[Testing Every API Requests On Posts Table]:', type: :request do
  let!(:blog) do
    Blog.create(title: 'test blog')
  end
  let!(:post1) do
    Post.create(title: 'test post 1', subtitle: 'subtitle1', content: 'c1', blog_id: blog.id, published: false)
  end
  let!(:post2) do
    Post.create(title: 'test post 2', subtitle: 'subtitle2', content: 'c2', blog_id: blog.id, published: true)
  end

  it '`GET /posts/` should return every data in database.' do
    get '/posts/'

    expect(response.status).to be(200)
    expect(JSON.parse(response.body)['data'].size).to eq(2)

    expect(JSON.parse(response.body)['data'][0]['title']).to eq('test post 1')
    expect(JSON.parse(response.body)['data'][0]['subtitle']).to eq('subtitle1')
    expect(JSON.parse(response.body)['data'][0]['content']).to eq('c1')
    expect(JSON.parse(response.body)['data'][0]['blog_id']).to eq(1)
    expect(JSON.parse(response.body)['data'][0]['published']).to eq(false)

    expect(JSON.parse(response.body)['data'][1]['title']).to eq('test post 2')
    expect(JSON.parse(response.body)['data'][1]['subtitle']).to eq('subtitle2')
    expect(JSON.parse(response.body)['data'][1]['content']).to eq('c2')
    expect(JSON.parse(response.body)['data'][1]['blog_id']).to eq(1)
    expect(JSON.parse(response.body)['data'][1]['published']).to eq(true)
  end

  it '`GET /posts/:id` should return the data called with id.' do
    get '/posts/' + post1.id.to_s

    expect(response.status).to be(200)

    expect(JSON.parse(response.body)['data']['title']).to eq(post1.title)
    expect(JSON.parse(response.body)['data']['subtitle']).to eq(post1.subtitle)
    expect(JSON.parse(response.body)['data']['content']).to eq(post1.content)
    expect(JSON.parse(response.body)['data']['blog_id']).to eq(post1.blog_id)
    expect(JSON.parse(response.body)['data']['published']).to eq(post1.published)

    get '/posts/' + post2.id.to_s

    expect(response.status).to be(200)

    expect(JSON.parse(response.body)['data']['title']).to eq(post2.title)
    expect(JSON.parse(response.body)['data']['subtitle']).to eq(post2.subtitle)
    expect(JSON.parse(response.body)['data']['content']).to eq(post2.content)
    expect(JSON.parse(response.body)['data']['blog_id']).to eq(post2.blog_id)
    expect(JSON.parse(response.body)['data']['published']).to eq(post2.published)
  end

  it '`POST /posts/ with params` should create data with params, then return id of the created post.' do
    valid_params = { 'title' => 'test post 3',
                     'subtitle' => 'subtitle3',
                     'content' => 'c3',
                     'blog_id' => blog.id,
                     'published' => false }

    expect { post '/posts/', params: { post: valid_params } }.to change(Post, :count).by(1)

    expect(response.status).to be(200)

    expect(JSON.parse(response.body)['id']).to eq(post2.id + 1)
  end

  it '`PATCH /posts/:id` should update data with params, then return id of the created post.' do
    valid_params = { 'content' => 'content changed' }
    patch '/posts/' + post1.id.to_s, params: { post: valid_params }

    expect(response.status).to be(200)
    expect(JSON.parse(response.body)['id']).to eq(post1.id)

    get '/posts/' + post1.id.to_s
    expect(response.status).to be(200)
    expect(JSON.parse(response.body)['data']['content']).to eq('content changed')
  end
end
