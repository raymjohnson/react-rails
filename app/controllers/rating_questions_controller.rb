class RatingQuestionsController < ApplicationController

  before_action :find_rating_question, only: [:show, :update, :edit, :destroy]

  def index
    @rating_questions = RatingQuestion.all
  end

  def show; end

  def new
    @rating_question = RatingQuestion.new
  end

  def create
    @rating_question = RatingQuestion.new(question_params)
    if @rating_question.save
      respond_to do |format|
        format.html { redirect_to @rating_question, notice: "Successfully created question: #{@rating_question[:title]}" }
        format.json { render :show, status: 201 }
      end
    else
      respond_to do |format|
        format.html { render :new, notice: { errors: @rating_question.errors.messages } }
        format.json { render json: { errors: @rating_question.errors.messages }, status: 422 }
      end
    end
  end

  def update
    if @rating_question.update(question_params)
      respond_to do |format|
        format.html { redirect_to @rating_question, notice: "Successfully updated" }
        format.json { render :show , status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit, notice: { errors: @rating_question.errors.messages } }
      end
    end
  end

  def edit; end

  def destroy
    if @rating_question.destroy
      respond_to do |format|
        format.html { redirect_to "/", notice: "Successfully deleted question: #{@rating_question[:title]}" }
        format.json { render json: {}, status: 204 }
      end
    end
  end

  private

  def question_params
    params.require(:rating_question).permit(:title, :tag)
  end

  def find_rating_question
    @rating_question = RatingQuestion.find(params[:id])
    head 404 unless @rating_question
  end

end

