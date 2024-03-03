class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.integer :group_id
      t.text :phone_number
      t.text :email

      t.timestamps
    end
  end
end
