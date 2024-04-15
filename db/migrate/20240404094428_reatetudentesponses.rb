# frozen_string_literal: true

class Reatetudentesponses < ActiveRecord::Migration[7.1]
  def change
    create_table :student_responses do |t|
      t.references :student, foreign_key: true
      t.references :task, foreign_key: true
      t.references :mark, foreign_key: true
      t.timestamps
      t.binary :attached_file
    end
  end
end
