class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.integer :group_id
      t.text :name

      t.timestamps
    end
  end
end
