class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[ index create]
  before_action :set_answears, only: %i[ show ]
  before_action :authenticate_user!, only: %i[ new index show ]
  # GET /questions or /questions.json
  def index
    @questions = Question.where(user_id: @user.id)
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new
    @question.title = title_params
    @question.user_id = @user.id
    @question.quiz_id = quiz_params
  
    respond_to do |format|
      if @question.save
        format.html { redirect_to quiz_path(quiz_params), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to quiz_path(@question.quiz_id), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_path, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end
    
    def title_params
      params.permit(:title)[:title]
    end

    def quiz_params
      params.permit(:quiz_id)[:quiz_id].to_i
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :quiz_id)
    end

    def set_user
      @user = current_user
    end

    def set_answears
      @answears = Answear.by_quiz_id(@question.id)
    end
    
end
