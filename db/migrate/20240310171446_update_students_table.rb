# frozen_string_literal: true

# db/migrate/20220310123456_update_students_table.rb

class UpdateStudentsTable < ActiveRecord::Migration[6.0]
  def change
    change_column :students, :group_id, :integer, null: true
  end
end
