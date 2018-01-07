class SurveyResponsesController < ApplicationController

  def new
    @survey_response = SurveyResponse.new
  end
end
