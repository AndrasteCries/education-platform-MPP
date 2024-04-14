class Subject < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :teacher
  has_many :lessons
end
