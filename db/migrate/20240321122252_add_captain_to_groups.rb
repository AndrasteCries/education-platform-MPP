class AddCaptainToGroups < ActiveRecord::Migration[7.1]
  def change
    add_column :groups_students, :captain, :boolean
  end
end
