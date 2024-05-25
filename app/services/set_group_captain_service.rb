class SetGroupCaptainService
  def initialize(group, captain_id)
    @group = group
    @captain_id = captain_id
  end

  def call
    student = Student.find(@captain_id)
    current_captain = @group.group_students.find_by(captain: true)

    if current_captain
      GroupStudent.where(group_id: @group.id, student_id: current_captain.student_id).update_all(captain: false)
    end
    captain_relation = @group.group_students.find_by(student_id: student.id)

    if captain_relation
      GroupStudent.where(group_id: @group.id, student_id: captain_relation.student_id).update_all(captain: true)
      "#{student.full_name} is now the captain of the group."
    else
      "#{student.full_name} is not a member of this group."
    end
  end
end
