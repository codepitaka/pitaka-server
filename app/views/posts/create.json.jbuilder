# frozen_string_literal: true

# instead of ERB(embedded Ruby), use Jbuilder to generate a JSON response
# file name 'create' should be correct
json.data @post
# json.extract! post, :title, :subtitle, :language, :content, :user_id # @post from 'app/controllers/posts_controllers'
