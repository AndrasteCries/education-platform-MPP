class LessonsWeek
  class << self
    delegate :call, to: :new
  end

  def initialize(current_teacher: nil, current_student: nil)
    @lessons_by_day = {}
    @time_slots = %w[8:30 10:10 12:00 13:40 15:20 17:00]
    set_week_range
  end

  def call(current_teacher: nil, current_student: nil)
    @current_teacher = current_teacher
    @current_student = current_student
    (@start_of_week..@end_of_week).each do |date|
      lessons_on_day = get_lessons_on_day(date)
      @lessons_by_day[date] = lessons_on_day unless lessons_on_day.empty?
    end
    @lessons_by_day
  end

  private

  def set_week_range
    @start_of_week = Date.today.beginning_of_week - 3.days
    @end_of_week = Date.today.end_of_week + 3.days
  end

  def get_lessons_on_day(date)
    if @current_teacher
      Lesson.joins(:subject).where(date: date, subjects: { teacher_id: @current_teacher.id })
    elsif @current_student
      group_ids = @current_student.groups.pluck(:id)
      Lesson.joins(subject: :groups).where(date: date, groups: { id: group_ids })
    else
      []
    end
  end
end
