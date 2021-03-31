class AnswearsController < ApplicationController
  before_action :set_answear, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new, index, show ]

  # GET /answears or /answears.json
  def index
    @answears = Answear.by_user(current_user.id)
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
    @answear = Answear.new
    @answear.description = answear_params[:description]
    @answear.lat = breadcrumb_params[:lat]
    @answear.lng = breadcrumb_params[:lng]
    @answear.question_id = breadcrumb_params[:question_id]

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
      params.permit(:description)
    end

    def breadcrumb_params
      params.permit(:question_id, :lat, :lng)
    end
end
