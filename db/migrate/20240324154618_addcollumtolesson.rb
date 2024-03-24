class Addcollumtolesson < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :time, :integer
  end
end
