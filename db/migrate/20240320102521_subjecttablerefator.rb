class Subjecttablerefator < ActiveRecord::Migration[7.1]
  def change
    create_join_table :groups, :subjects do |t|
      t.index %i[group_id subject_id]
      t.index %i[subject_id group_id]
    end

    add_column :students, :teacher_id, :integer
  end
end
