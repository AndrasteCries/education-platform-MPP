# frozen_string_literal: true

class CreateJoinTableStudentsGroups < ActiveRecord::Migration[7.1]
  def change
    create_join_table :students, :groups do |t|
      t.index %i[student_id group_id]
      t.index %i[group_id student_id]
    end
  end
end
