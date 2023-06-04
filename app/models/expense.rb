# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { maximum: 120 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0, only_float: true }
end
