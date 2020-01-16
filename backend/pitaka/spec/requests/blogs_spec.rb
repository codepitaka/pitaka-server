# trailing '_spec.rb' of the file name is important

require 'rails_helper'

describe "APIs related with blogs", :type => :request do
    it "GET /blogs/" do
        Blog.create(title: "test blog 1")
        Blog.create(title: "test blog 2")
        Blog.create(title: "test blog 3")

        get '/blogs/'

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)["data"].size).to eq(3)
        expect(JSON.parse(response.body)["data"][0]["title"]).to eq("test blog 1")
    end
end
