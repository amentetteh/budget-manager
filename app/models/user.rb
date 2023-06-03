class User < ApplicationRecord
    has_many :expenses, dependent: :destroy, foreign_key: 'author_id'
    has_many :groups, dependent: :destroy, foreign_key: 'author_id'
  
    validates :name, presence: true, length: { maximum: 120 }
  end
  