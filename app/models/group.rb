# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_and_belongs_to_many :expenses

  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 120 }
  validates :icon, presence: true, length: { maximum: 250 }
end
