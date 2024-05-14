class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show edit update destroy]

  # GET /lessons or /lessons.json
  def index
    @time_slots = %w[8:30 10:10 12:00 13:40 15:20 17:00]
    @lessons_by_day = Lesson.week_lessons(current_teacher: current_teacher, current_student: current_student)
  end

  # GET /lessons/1 or /lessons/1.json
  def show; end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit; end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.subject = Subject.find_by(id: lesson_params[:subject_id])
    lesson_time = Lesson.lesson_times[lesson_params[:lesson_time]]
    date = Date.parse(lesson_params[:date])

    existing_lesson = Lesson.find_by(date:, lesson_time:)
    if existing_lesson.present?
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity, locals: {lesson: @lesson} }
        format.json do
          render json: {error: "A lesson for this time and date already exists."}, status: :unprocessable_entity
        end
      end
      return
    end

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy!

    respond_to do |format|
      format.html { redirect_to lessons_url, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.require(:lesson).permit(:title, :notes, :date, :lesson_type, :subject_id, :lesson_time)
  end
end
