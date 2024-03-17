class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :name
      t.string :image_src
      t.text :text_content

      t.timestamps
    end
  end
end
