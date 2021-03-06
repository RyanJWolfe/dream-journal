class DreamLogsController < ApplicationController
  before_action :set_journal
  before_action :set_dream_log, only: %i[show edit update destroy]
  before_action :verify_user, only: %i[create edit update destroy new]

  # GET /dream_logs or /dream_logs.json
  def index
    @dream_logs = @journal.dream_logs
  end

  # GET /dream_logs/1 or /dream_logs/1.json
  def show
    @dream_log = DreamLog.find(params[:id])
  end

  # GET /dream_logs/new
  def new
    @dream_log = DreamLog.new(journal_id: @journal.id, dream: true, sleep_time: 0)
    if params[:created_at]
      @dream_log.created_at = params[:created_at]
    end
  end

  # GET /dream_logs/1/edit
  def edit
    @dream_log = DreamLog.find(params[:id])
  end

  # POST /dream_logs or /dream_logs.json
  def create
    @journal.dream_logs.create! dream_log_params
    redirect_to @journal
  end

  # PATCH/PUT /dream_logs/1 or /dream_logs/1.json
  def update
    @dream_log = DreamLog.find(params[:id])
    respond_to do |format|
      if @dream_log.update(dream_log_params)
        format.html { redirect_to journal_dream_log_path(@dream_log.journal_id), notice: 'Dream log was successfully updated.' }
        format.json { render :show, status: :ok, location: @dream_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dream_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dream_logs/1 or /dream_logs/1.json
  def destroy
    @dream_log = DreamLog.find(params[:id])
    @dream_log.destroy

    respond_to do |format|
      format.html { redirect_to @journal, notice: 'Dream log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def verify_user
    redirect_to(new_user_session_path, notice: 'Please sign in to continue!') and return unless current_user

    redirect_to(@journal, notice: 'You cannot edit this journal') unless current_user.id == @journal.user_id
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_journal
    @journal = Journal.find(params[:journal_id])
  end

  def set_dream_log
    @dream_log = DreamLog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dream_log_params
    params.require(:dream_log).permit(:dream, :remember, :body, :sleep_time, :journal_id, :created_at)
  end
end
