class WorksheetsController < ApplicationController
  before_action :set_worksheet, only: %i[show edit update destroy]

  # GET /worksheets or /worksheets.json
  def index
    @worksheets = Worksheet.all
  end

  # GET /worksheets/1 or /worksheets/1.json
  def show; end

  # GET /worksheets/new
  def new
    @worksheet = Worksheet.new
  end

  # GET /worksheets/1/edit
  def edit; end

  # POST /worksheets or /worksheets.json
  def create
    @worksheet = Worksheet.new(worksheet_params)

    respond_to do |format|
      if @worksheet.save
        format.html { redirect_to worksheet_url(@worksheet), notice: 'Worksheet was successfully created.' }
        format.json { render :show, status: :created, location: @worksheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worksheets/1 or /worksheets/1.json
  def update
    respond_to do |format|
      if @worksheet.update(worksheet_params)
        format.html { redirect_to worksheet_url(@worksheet), notice: 'Worksheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @worksheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worksheets/1 or /worksheets/1.json
  def destroy
    @worksheet.destroy

    respond_to do |format|
      format.html { redirect_to worksheets_url, notice: 'Worksheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_worksheet
    @worksheet = Worksheet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def worksheet_params
    params.require(:worksheet).permit(:created_by, :title, :description, :task_manager, :deadline, :completed,
                                      :completed_at, :completed_by)
  end
end
