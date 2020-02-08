# frozen_string_literal: true

# instead of ERB(embedded Ruby), use Jbuilder to generate a JSON response
# file name 'update' should be correct
json.id @post.id # @post from 'app/controllers/posts_controllers'
