class AddColumnToLesson < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :lesson_type, :integer
  end
end
