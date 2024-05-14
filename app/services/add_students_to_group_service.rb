class AddStudentsToGroupService
  def initialize(group, student_ids)
    @group = group
    @student_ids = student_ids
  end

  def call
    return unless @student_ids.present?

    students = Student.where(id: @student_ids).where.not(id: @group.student_ids)
    @group.students << students
  end
end