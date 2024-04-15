# frozen_string_literal: true

class CreateSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.integer :subject_id
      t.text :title
      t.text :description
      t.integer :hours
      t.text :difficulty_level
      t.integer :lessons_id

      t.timestamps
    end
  end
end
