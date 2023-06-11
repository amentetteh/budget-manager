# frozen_string_literal: true

class JoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :expenses, :groups do |t|
      t.index %i[expense_id group_id]
      t.index %i[group_id expense_id]
    end
  end
end
