# frozen_string_literal: true

class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.integer :teacher_id
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.text :phone_number
      t.text :email
      t.text :degree

      t.timestamps
    end
  end
end
