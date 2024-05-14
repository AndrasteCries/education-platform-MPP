class StudentSubjects
  class << self
    delegate :call, to: :new
  end

  def initialize

  end

  def call(current_teacher: nil, current_student: nil)
    @current_teacher = current_teacher
    @current_student = current_student
    if @current_teacher
      Subject.where(teacher_id: @current_teacher.id)
    elsif @current_student
      group_ids = @current_student.groups.pluck(:id)
      Subject.joins(:groups).where(groups: { id: group_ids }).distinct
    else
      []
    end
  end
end
