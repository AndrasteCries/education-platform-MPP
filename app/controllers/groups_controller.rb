# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show; end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_students
    @group = Group.find(params[:id])
    student_ids = params[:group][:student_ids]
    if student_ids.present?
      students = Student.where(id: student_ids).where.not(id: @group.student_ids)
      @group.students << students
      redirect_to @group, notice: "Students were successfully added to the group."
    else
      redirect_to @group, alert: "Please select students to add."
    end
  end

  def add_students_form
    @group = Group.find(params[:id])
  end

  def remove_students_form
    @group = Group.find(params[:id])
  end

  def remove_students
    @group = Group.find(params[:id])
    student_ids = params[:group][:student_ids]
    if student_ids.present?
      students = Student.where(id: student_ids)
      @group.students.delete(students)
      redirect_to @group, notice: "Students were successfully removed from the group."
    else
      redirect_to @group, alert: "Please select students to remove."
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy!

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def set_captain
    @group = Group.find(params[:id])
    student = Student.find(params[:group][:captain_id])

    revoke_current_captain
    assign_new_captain(student)
  end

  private

  def revoke_current_captain
    current_captain = @group.group_students.find_by(captain: true)
    return unless current_captain

    GroupStudent.where(group_id: @group.id, student_id: current_captain.student_id).update_all(captain: false)
  end

  def assign_new_captain(student)
    captain_relation = @group.group_students.find_by(student_id: student.id)
    if captain_relation
      GroupStudent.where(group_id: @group.id, student_id: student.id).update_all(captain: true)
      redirect_to @group, notice: "#{student.full_name} is now the captain of the group."
    else
      redirect_to @group, alert: "#{student.full_name} is not a member of this group."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:group_id, :name)
  end
end
