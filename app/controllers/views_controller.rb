class ViewsController < ApplicationController
  before_action :set_view, only: %i[ show edit update destroy ]

  # GET /views or /views.json
  def index
    @views = View.all
  end

  # GET /views/1 or /views/1.json
  def show
  end

  # GET /views/new
  def new
    @view = View.new
  end

  # GET /views/1/edit
  def edit
  end

  # POST /views or /views.json
  def create
    @view = View.new(view_params)

    respond_to do |format|
      if @view.save
        format.html { redirect_to view_url(@view), notice: "View was successfully created." }
        format.json { render :show, status: :created, location: @view }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @view.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /views/1 or /views/1.json
  def update
    respond_to do |format|
      if @view.update(view_params)
        format.html { redirect_to view_url(@view), notice: "View was successfully updated." }
        format.json { render :show, status: :ok, location: @view }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /views/1 or /views/1.json
  def destroy
    @view.destroy

    respond_to do |format|
      format.html { redirect_to views_url, notice: "View was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_view
      @view = View.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def view_params
      params.require(:view).permit(:entity_type, :entity_id, :user_id, :view_time)
    end
end
