# frozen_string_literal: true

class CreateMarks < ActiveRecord::Migration[7.1]
  def change
    create_table :marks do |t|
      t.integer :student_id
      t.integer :task_id
      t.date :date
      t.integer :mark

      t.timestamps
    end
  end
end
