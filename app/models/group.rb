class Group < ApplicationRecord
  has_and_belongs_to_many :students, join_table: 'groups_students'
  has_and_belongs_to_many :subjects
  has_many :group_students

  def captain
    captain_relation = group_students.find_by(captain: true)
    if captain_relation
      Student.find(captain_relation.student_id)
    else
      nil
    end
  end
end
