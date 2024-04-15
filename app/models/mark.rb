# frozen_string_literal: true

class Mark < ApplicationRecord
  belongs_to :student
  belongs_to :task

  validates :mark, presence: true
end
