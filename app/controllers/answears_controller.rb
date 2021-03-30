class AnswearsController < ApplicationController
  before_action :set_answear, only: %i[ show edit update destroy ]

  # GET /answears or /answears.json
  def index
    @answears = Answear.all
  end

  # GET /answears/1 or /answears/1.json
  def show
  end

  # GET /answears/new
  def new
    @answear = Answear.new
  end

  # GET /answears/1/edit
  def edit
  end

  # POST /answears or /answears.json
  def create
    @answear = Answear.new(answear_params)

    respond_to do |format|
      if @answear.save
        format.html { redirect_to @answear, notice: "Answear was successfully created." }
        format.json { render :show, status: :created, location: @answear }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answears/1 or /answears/1.json
  def update
    respond_to do |format|
      if @answear.update(answear_params)
        format.html { redirect_to @answear, notice: "Answear was successfully updated." }
        format.json { render :show, status: :ok, location: @answear }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answears/1 or /answears/1.json
  def destroy
    @answear.destroy
    respond_to do |format|
      format.html { redirect_to answears_url, notice: "Answear was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answear
      @answear = Answear.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answear_params
      params.require(:answear).permit(:description, :question_id, :lat, :lng)
    end
end