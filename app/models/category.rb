class Category < ApplicationRecord
    has_many :e_docs, dependent: :destroy



   
end
