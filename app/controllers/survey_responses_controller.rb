class SurveyResponsesController < ApplicationController

  def new
    @survey_response = SurveyResponse.new
  end

  def create
    @survey_response = SurveyResponse.new(survey_response_params)

    if @survey_response.save
      flash[:success] = "Survey was saved"
      redirect_to survey_responses_path
    else
      render :new
    end
  end

  def index
    @survey_responses = SurveyResponse.all
  end

  private

  def survey_response_params
    params.require(:survey_response).permit(:perceived_code_confidence, :material_difficulty_rating, :notes)
  end
end
