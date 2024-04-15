# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show edit update destroy]

  # GET /lessons or /lessons.json
  def index
    @lessons_by_day = {}
    @start_of_week = Date.today.beginning_of_week - 3.days
    @end_of_week = Date.today.end_of_week + 3.days
    @time_slots = %w[8:30 10:10 12:00 13:40 15:20 17:00]

    (@start_of_week..@end_of_week).each do |date|
      lessons_on_day = fetch_lessons(date)
      @lessons_by_day[date] = lessons_on_day unless lessons_on_day.empty?
    end
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
    @lesson = build_lesson
    existing_lesson = find_existing_lesson

    if existing_lesson
      handle_existing_lesson
    else
      handle_new_lesson
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

  def build_lesson
    lesson = Lesson.new(lesson_params)
    lesson.subject = Subject.find_by(id: lesson_params[:subject_id])
    lesson
  end

  def find_existing_lesson
    Lesson.find_by(date: lesson_date, lesson_time:)
  end

  def handle_existing_lesson
    respond_to do |format|
      format.html { render :new, status: :unprocessable_entity, locals: {lesson: @lesson} }
      format.json {
        render json: {error: "A lesson for this time and date already exists."}, status: :unprocessable_entity
      }
    end
  end

  def handle_new_lesson
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

  def lesson_date
    Date.parse(lesson_params[:date])
  end

  def lesson_time
    Lesson.lesson_times[lesson_params[:lesson_time]]
  end

  def fetch_lessons(date)
    if current_teacher
      Lesson.joins(:subject).where(date:, subjects: {teacher_id: current_teacher.id})
    elsif current_student
      lessons_for_student(date)
    else
      []
    end
  end

  def lessons_for_student(date)
    student_groups = current_student.groups
    group_ids = student_groups.pluck(:id)
    lessons = []

    group_ids.each do |group_id_from_ids|
      group_id = Group.find(group_id_from_ids)
      lessons.concat(Lesson.joins(subject: :groups).where(groups: {id: group_id}, date:))
    end

    lessons
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.require(:lesson).permit(:title, :notes, :date, :lesson_type, :subject_id, :lesson_time)
  end
end
