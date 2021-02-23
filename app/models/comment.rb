class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :e_doc
end
