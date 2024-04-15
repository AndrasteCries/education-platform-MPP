# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :lesson
  has_many :student_responses, dependent: :destroy
end
