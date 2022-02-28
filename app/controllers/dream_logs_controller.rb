class DreamLogsController < ApplicationController
  before_action :set_dream_log, only: %i[ show edit update destroy ]

  # GET /dream_logs or /dream_logs.json
  def index
    @dream_logs = DreamLog.all
  end

  # GET /dream_logs/1 or /dream_logs/1.json
  def show
  end

  # GET /dream_logs/new
  def new
    @dream_log = DreamLog.new
  end

  # GET /dream_logs/1/edit
  def edit
  end

  # POST /dream_logs or /dream_logs.json
  def create
    @dream_log = DreamLog.new(dream_log_params)

    respond_to do |format|
      if @dream_log.save
        format.html { redirect_to dream_log_url(@dream_log), notice: "Dream log was successfully created." }
        format.json { render :show, status: :created, location: @dream_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dream_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dream_logs/1 or /dream_logs/1.json
  def update
    respond_to do |format|
      if @dream_log.update(dream_log_params)
        format.html { redirect_to dream_log_url(@dream_log), notice: "Dream log was successfully updated." }
        format.json { render :show, status: :ok, location: @dream_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dream_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dream_logs/1 or /dream_logs/1.json
  def destroy
    @dream_log.destroy

    respond_to do |format|
      format.html { redirect_to dream_logs_url, notice: "Dream log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dream_log
      @dream_log = DreamLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dream_log_params
      params.require(:dream_log).permit(:dream, :remember, :body, :sleep_time, :journal_id)
    end
end
