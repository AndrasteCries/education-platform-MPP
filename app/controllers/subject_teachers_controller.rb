class SubjectTeachersController < ApplicationController
  before_action :set_subject_teacher, only: %i[show edit update destroy]

  # GET /subject_teachers or /subject_teachers.json
  def index
    @subject_teachers = SubjectTeacher.all
  end

  # GET /subject_teachers/1 or /subject_teachers/1.json
  def show; end

  # GET /subject_teachers/new
  def new
    @subject_teacher = SubjectTeacher.new
  end

  # GET /subject_teachers/1/edit
  def edit; end

  # POST /subject_teachers or /subject_teachers.json
  def create
    @subject_teacher = SubjectTeacher.new(subject_teacher_params)

    respond_to do |format|
      if @subject_teacher.save
        format.html do
          redirect_to subject_teacher_url(@subject_teacher), notice: "Subject teacher was successfully created."
        end
        format.json { render :show, status: :created, location: @subject_teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_teachers/1 or /subject_teachers/1.json
  def update
    respond_to do |format|
      if @subject_teacher.update(subject_teacher_params)
        format.html do
          redirect_to subject_teacher_url(@subject_teacher), notice: "Subject teacher was successfully updated."
        end
        format.json { render :show, status: :ok, location: @subject_teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_teachers/1 or /subject_teachers/1.json
  def destroy
    @subject_teacher.destroy!

    respond_to do |format|
      format.html { redirect_to subject_teachers_url, notice: "Subject teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject_teacher
    @subject_teacher = SubjectTeacher.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subject_teacher_params
    params.require(:subject_teacher).permit(:subject_id, :teacher_id, :group_id)
  end
end
