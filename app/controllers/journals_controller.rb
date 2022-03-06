# frozen_string_literal: true

# Controller for Journals
class JournalsController < ApplicationController
  before_action :set_journal, only: %i[show edit update destroy]

  # GET /journals or /journals.json
  def index
    if journal_user_params[:user_id]
      @journals = current_user.journals
    else
      @journals = Journal.all
    end
  end

  # GET /journals/1 or /journals/1.json
  def show; end

  # GET /journals/new
  def new
    @journal = Journal.new
  end

  # GET /journals/1/edit
  def edit; end

  # POST /journals or /journals.json
  def create
    @journal = current_user.journals.create! journal_params

    respond_to do |format|
      if @journal.save
        format.html { redirect_to journal_url(@journal), notice: 'Journal was successfully created.' }
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journals/1 or /journals/1.json
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to journal_url(@journal), notice: 'Journal was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1 or /journals/1.json
  def destroy
    @journal.destroy

    respond_to do |format|
      format.html { redirect_to journals_url, notice: 'Journal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_journal
    @journal = Journal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def journal_params
    params.require(:journal).permit(:title, :author, :user_id)
  end

  def journal_user_params
    params.permit(:user_id)
  end
end
