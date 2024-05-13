class StudentResponsesController < ApplicationController
  before_action :set_student_response, only: %i[show edit update destroy]

  def index
    @student_responses = StudentResponse.all
  end

  def show
    task = @student_response.task
    @max_mark = task.max_mark
  end

  def new
    @student_response = StudentResponse.new
  end

  def create
    @student_response = StudentResponse.new(student_response_params)
    @student_response.student = current_student
    @student_response.task = Task.find_by(id: student_response_params[:task_id])

    if @student_response.save
      redirect_to @student_response, notice: "Student response was successfully created."
    else
      render :new
    end
  end

  def evaluate
    @student_response = StudentResponse.find(params[:id])
    @mark = Mark.new(mark: params[:student_response][:mark])
    @mark.student_id = @student_response.student_id
    @mark.task_id = @student_response.task_id
    @mark.date = Date.today

    return unless @mark.save

    @student_response.update(mark_id: @mark.id)
    redirect_to task_path(@student_response.task), notice: "Student response was successfully evaluated."
  end

  def edit; end

  def update
    if @student_response.update(student_response_params)
      redirect_to @student_response, notice: "Student response was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @student_response.destroy
    redirect_to task_path(@student_response.task), notice: "Student response was successfully destroyed."
  end


  private

  def set_student_response
    @student_response = StudentResponse.find(params[:id])
  end

  def mark_params
    params.require(:mark).permit(:mark)
  end

  def student_response_params
    params.require(:student_response).permit(:student_id, :task_id, :mark_id, :file)
  end
end
