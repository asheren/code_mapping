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
    survey_response.valid?
    expect(survey_response).to_not be_valid
    expect(survey_response.errors[:perceived_code_confidence]).to include("can't be blank")
  end

  it "validates that material difficulty rating is answered" do
    survey_response = build(:survey_response)
    survey_response.valid?
    expect(survey_response).to_not be_valid
    expect(survey_response.errors[:material_difficulty_rating]).to include("can't be blank")
  end

  it "validates that perceived code confidence is within the range of acceptable integers" do
    survey_response = build(:survey_response, perceived_code_confidence: 15)
    survey_response.valid?
    expect(survey_response).to_not be_valid
    expect(survey_response.errors[:perceived_code_confidence]).to include("#{survey_response.perceived_code_confidence} must be an integer from 1 to 10")
  end

  it "validates that perceived code confidence is within the range of acceptable integers" do
    survey_response = build(:survey_response, material_difficulty_rating: 22)
    survey_response.valid?
    expect(survey_response).to_not be_valid
    expect(survey_response.errors[:material_difficulty_rating]).to include("#{survey_response.material_difficulty_rating} must be an integer from 1 to 10")
  end
end
