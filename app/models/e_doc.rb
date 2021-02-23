class EDoc < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :histories
  has_one_attached :file
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :docname, presence: true
  validates :description, presence: true, length: { maximum: 140 }

def cmtfeed  
  self.comments 
end
def self.search(term)
  if term
      EDoc.where('docname LIKE?', "%#{term}%")

  else
      all
  end
end




end
