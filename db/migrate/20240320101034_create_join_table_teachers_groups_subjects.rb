# frozen_string_literal: true

class CreateJoinTableTeachersGroupsSubjects < ActiveRecord::Migration[7.1]
  def change
    create_join_table :teachers, :subjects do |t|
      t.index %i[teacher_id subject_id]
      t.index %i[subject_id teacher_id]
    end
  end
end
