class Subject < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :teacher
  has_many :lessons

  scope :my_subjects, StudentSubjects

  def self.recent(limit)
    order(created_at: :desc).limit(limit)
  end
end
