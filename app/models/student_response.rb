# frozen_string_literal: true

class StudentResponse < ApplicationRecord
  belongs_to :student
  belongs_to :task

  has_one_attached :file
end
