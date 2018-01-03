# == Schema Information
#
# Table name: survey_responses
#
#  id                         :integer          not null, primary key
#  perceived_code_confidence  :integer
#  material_difficulty_rating :integer
#  notes                      :text
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

require "rails_helper"

RSpec.describe SurveyResponse, type: :model do
  # validation specs for question 1 and question 2
  it "validates that perceived code confidence is answered" do
    survey_response = build(:survey_response)
    survey_response.perceived_code_confidence
    survey_response.valid?
    expect(survey_response).to_not be_valid
    expect(survey_response.errors).to include([""])


    # create survey response
    # update it to add question answer
    # expect the question won't save to the DB if the validation fails
  end

  it "validates that material difficulty rating is answered"
end
