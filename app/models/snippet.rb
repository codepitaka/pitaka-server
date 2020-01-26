class Snippet < ApplicationRecord
    enum status: {readable: 0, executable: 1, editable: 2}
    belongs_to :post
    validates :code, :post_id, :status, presence: true
end
