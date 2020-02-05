# frozen_string_literal: true

# trailing '_spec.rb' of the file name is important

require 'rails_helper'

describe 'APIs related with posts', type: :request do
  before(:suite, :altering_database => true) do
    DatabaseCleaner.clean_with(:truncation)
  end

  before(:each) do
	DatabaseCleaner.start
    @blog = Blog.create(title: 'test blog')
    @post1 = Post.create(title: 'test post 1', subtitle: 'subtitle1', content: 'c1', blog_id: @blog.id)
    @post2 = Post.create(title: 'test post 2', subtitle: 'subtitle2', content: 'c2', blog_id: @blog.id)
  end
	
  after(:each, :altering_database => true) do
    DatabaseCleaner.clean_with(:truncation)
  end
	
  it 'GET /posts/' do
    get '/posts/'
    
	expect(response.status).to be(200)
	  
    expect(JSON.parse(response.body)['data'].size).to eq(2)
	  
	expect(JSON.parse(response.body)['data'][0]['id']).to eq(2)
	expect(JSON.parse(response.body)['data'][0]['title']).to eq('test post 1')
	expect(JSON.parse(response.body)['data'][0]['subtitle']).to eq('subtitle1')
	expect(JSON.parse(response.body)['data'][0]['content']).to eq('c1')
	expect(JSON.parse(response.body)['data'][0]['blog_id']).to eq(6)
	
	expect(JSON.parse(response.body)['data'][1]['id']).to eq(3)
	expect(JSON.parse(response.body)['data'][1]['title']).to eq('test post 2')
	expect(JSON.parse(response.body)['data'][1]['subtitle']).to eq('subtitle2')
	expect(JSON.parse(response.body)['data'][1]['content']).to eq('c2')
	expect(JSON.parse(response.body)['data'][1]['blog_id']).to eq(6)
  end

  it 'GET /posts/:id' do
    get '/posts/' + @post1.id.to_s
	  
    expect(response.status).to be(200)
	  
    expect(JSON.parse(response.body)['data']['title']).to eq(@post1.title)
    expect(JSON.parse(response.body)['data']['subtitle']).to eq(@post1.subtitle)
	expect(JSON.parse(response.body)['data']['content']).to eq(@post1.content)
    expect(JSON.parse(response.body)['data']['blog_id']).to eq(@post1.blog_id)
	  
	get '/posts/' + @post2.id.to_s
	  
    expect(response.status).to be(200)
	  
    expect(JSON.parse(response.body)['data']['title']).to eq(@post2.title)
    expect(JSON.parse(response.body)['data']['subtitle']).to eq(@post2.subtitle)
	expect(JSON.parse(response.body)['data']['content']).to eq(@post2.content)
    expect(JSON.parse(response.body)['data']['blog_id']).to eq(@post2.blog_id)
  end
	
  it 'POST /posts/' do
	valid_params = {"title" => 'test post 3', "subtitle" => 'subtitle3', "content" => 'c3', "blog_id" => @blog.id}

    expect{post '/posts/', :params => {:post => valid_params}}.to change(Post, :count).by(1)	  
    
	expect(response.status).to be(200)
    expect(JSON.parse(response.body)['id']).to eq(8)
  end

  it 'PATCH /posts/:id' do
	valid_params = {"content" => 'c changed'}
	patch '/posts/' + @post1.id.to_s, :params => {:post => valid_params}

    expect(response.status).to be(200)
    expect(JSON.parse(response.body)['id']).to eq(9)
	  
	get '/posts/' + @post1.id.to_s
    expect(response.status).to be(200)
	expect(JSON.parse(response.body)['data']['content']).to eq('c changed')
  end
end
