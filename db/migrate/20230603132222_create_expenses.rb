# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :author, foreign_key: { to_table: :users }, index: true
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
