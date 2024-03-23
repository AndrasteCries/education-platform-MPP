class Lesson < ApplicationRecord
  belongs_to :subject
  enum lesson_type: { lecture: 0, seminar: 1, practical: 2 }
end
