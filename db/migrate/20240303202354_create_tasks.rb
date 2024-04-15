# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.text :title
      t.integer :lesson_id
      t.text :notes
      t.date :deadline
      t.text :material
      t.integer :max_mark

      t.timestamps
    end
  end
end
