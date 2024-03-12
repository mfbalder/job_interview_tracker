class InterviewsController < ApplicationController
  before_action :set_interview, only: %i[show edit update destroy]
  before_action :get_job

  # GET /interviews or /interviews.json
  def index
    @interviews = Interview.all
  end

  # GET /interviews/1 or /interviews/1.json
  def show; end

  # GET /interviews/new
  def new
    @interview = @job.interviews.build
  end

  # GET /interviews/1/edit
  def edit; end

  # POST /interviews or /interviews.json
  def create
    @interview = @job.interviews.build(interview_params)

    respond_to do |format|
      if @interview.save
        format.html { redirect_to job_url(@job), notice: "Interview was successfully created." }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1 or /interviews/1.json
  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to job_path(@job), notice: "Interview was successfully updated." }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1 or /interviews/1.json
  def destroy
    @interview.destroy!

    respond_to do |format|
      format.html { redirect_to interviews_url, notice: "Interview was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_interview
    @interview = Interview.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def interview_params
    params.require(:interview).permit(:date, :start_time, :end_time, :questions_to_ask, :notes, :reflections, :job_id, :interviewer_name)
  end

  def get_job
    @job = Job.find(params[:job_id])
  end
end
