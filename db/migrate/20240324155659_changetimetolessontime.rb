# frozen_string_literal: true

class Changetimetolessontime < ActiveRecord::Migration[7.1]
  def change
    remove_column :lessons, :time, :lesson_time
  end
end
