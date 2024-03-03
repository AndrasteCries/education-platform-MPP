class MarksController < ApplicationController
  before_action :set_mark, only: %i[ show edit update destroy ]

  # GET /marks or /marks.json
  def index
    @marks = Mark.all
  end

  # GET /marks/1 or /marks/1.json
  def show
  end

  # GET /marks/new
  def new
    @mark = Mark.new
  end

  # GET /marks/1/edit
  def edit
  end

  # POST /marks or /marks.json
  def create
    @mark = Mark.new(mark_params)

    respond_to do |format|
      if @mark.save
        format.html { redirect_to mark_url(@mark), notice: "Mark was successfully created." }
        format.json { render :show, status: :created, location: @mark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marks/1 or /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to mark_url(@mark), notice: "Mark was successfully updated." }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1 or /marks/1.json
  def destroy
    @mark.destroy!

    respond_to do |format|
      format.html { redirect_to marks_url, notice: "Mark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mark_params
      params.require(:mark).permit(:student_id, :task_id, :date, :mark)
    end
end
