# frozen_string_literal: true

class Student < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :groups
  has_many :student_responses
  has_many :messages, as: :recipient
  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
