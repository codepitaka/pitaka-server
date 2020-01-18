# frozen_string_literal: true

# instead of ERB(embedded Ruby), use Jbuilder to generate a JSON response
# file name 'index' should be correct
json.data @blogs # @blogs from 'app/controllers/blogs_controllers'
