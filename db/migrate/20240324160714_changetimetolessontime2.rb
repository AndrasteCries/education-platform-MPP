# frozen_string_literal: true

class Changetimetolessontime2 < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :lesson_time, :integer
  end
end
