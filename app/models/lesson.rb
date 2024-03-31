class Lesson < ApplicationRecord
  belongs_to :subject
  has_many :tasks
  enum lesson_type: { lecture: 0, seminar: 1, practical: 2 }
  enum lesson_time: {
    "8:30" => 0,
    "10:10" => 1,
    "12:00" => 2,
    "13:40" => 3,
    "15:20" => 4,
    "17:00" => 5
  }
end
