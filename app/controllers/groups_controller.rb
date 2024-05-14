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
    AddStudentsToGroupService.new(@group, student_ids).call
    redirect_to @group, notice: "Students were successfully added to the group."
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
    notice_message = SetGroupCaptainService.new(@group, params[:group][:captain_id]).call
    redirect_to @group, notice: notice_message
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:group_id, :name)
  end
end
