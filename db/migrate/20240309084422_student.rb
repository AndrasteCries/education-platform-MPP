class Student < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :password, :string
    add_column :teachers, :password, :string
  end
end
