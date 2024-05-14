class CreateLessonService
  def initialize(lesson_params)
    @lesson_params = lesson_params
  end

  def call
    @existing_lesson = find_existing_lesson
    puts @existing_lesson
    return nil if @existing_lesson.present?

    @lesson = Lesson.new(@lesson_params)
    @lesson.subject = Subject.find_by(id: @lesson_params[:subject_id])

    if @lesson.save
      @lesson
    else
      nil
    end
  end

  private

  def find_existing_lesson
    lesson_time = Lesson.lesson_times[@lesson_params[:lesson_time]]
    date = Date.parse(@lesson_params[:date])
    Lesson.find_by(date: date, lesson_time: lesson_time)
  end
end
