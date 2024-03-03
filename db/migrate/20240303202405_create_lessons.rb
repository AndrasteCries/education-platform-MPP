class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.text :title
      t.integer :subject_id
      t.text :notes
      t.date :date
      t.integer :teacher_id

      t.timestamps
    end
  end
end
