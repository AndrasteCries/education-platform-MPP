# frozen_string_literal: true

class RemoveOurIdFromTables < ActiveRecord::Migration[7.1]
  def change
    remove_column :subjects, :subject_id, :integer
    remove_column :groups, :group_id, :integer
    remove_column :teachers, :teacher_id, :integer
  end
end
