# frozen_string_literal: true

class CreateSubjectTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :subject_teachers do |t|
      t.integer :subject_id
      t.integer :teacher_id
      t.integer :group_id

      t.timestamps
    end
  end
end
