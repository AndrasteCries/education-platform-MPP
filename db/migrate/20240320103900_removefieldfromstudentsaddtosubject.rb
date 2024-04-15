# frozen_string_literal: true

class Removefieldfromstudentsaddtosubject < ActiveRecord::Migration[7.1]
  def change
    add_column :subjects, :teacher_id, :integer

    remove_column :students, :teacher_id, :integer
  end
end
