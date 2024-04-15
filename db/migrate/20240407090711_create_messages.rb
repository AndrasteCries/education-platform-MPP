# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :recipient_type
      t.integer :recipient_id

      t.timestamps
    end
  end
end
