class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]

  # GET /subjects or /subjects.json
  def index
    if current_teacher
      @subjects = Subject.where(teacher_id: current_teacher.id)
    elsif current_student
      student_groups = current_student.groups
      group_ids = student_groups.pluck(:id)
      subjects = []
      group_ids.each do |group_id|
        group_ids = student_groups.pluck(:id)
        subjects = Subject.joins(:groups).where(groups: { id: group_ids })
      end
      subjects.length <= 0 ? @subjects = [] : @subjects = subjects
    else
      @subjects = []
    end

  end

  # GET /subjects/1 or /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects or /subjects.json
  def create
    @subject = Subject.new(subject_params)
    @subject.teacher = current_teacher

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subject_url(@subject), notice: "Subject was successfully created." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_group
    @subject = Subject.find(params[:id])
    group_ids = params[:subject][:group_ids]
    if group_ids.present?
      groups = Group.where(id: group_ids).where.not(id: @subject.group_ids)
      @subject.groups << groups
      redirect_to @subject, notice: 'Students were successfully added to the group.'
    else
      redirect_to @subject, alert: 'Please select students to add.'
    end
  end

  def add_group_form
    @subject = Subject.find(params[:subject_id])
  end

  def remove_group_form
    @subject = Subject.find(params[:subject_id])
    @group = Group.find(params[:id])
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subject_url(@subject), notice: "Subject was successfully updated." }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    @subject.destroy!

    respond_to do |format|
      format.html { redirect_to subjects_url, notice: "Subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subject_params
    params.require(:subject).permit(:subject_id, :title, :description, :hours, :difficulty_level, :lessons_id)
  end
end
