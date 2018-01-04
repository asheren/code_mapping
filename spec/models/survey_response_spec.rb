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
  it "validates that perceived code confidence is answered" do
    survey_response = build(:survey_response)
    survey_response.perceived_code_confidence
    survey_response.valid?
    expect(survey_response).to_not be_valid
    expect(survey_response.errors.messages.values).to include(["can't be blank"])
  end

  it "validates that material difficulty rating is answered" do
    survey_response = build(:survey_response)
    survey_response.material_difficulty_rating
    survey_response.valid?
    expect(survey_response).to_not be_valid
    expect(survey_response.errors.messages.values).to include(["can't be blank"])
  end
end
