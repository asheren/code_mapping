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

FactoryBot.define do
  factory :survey_response do
    user
    perceived_code_confidence 6
    material_difficulty_rating 3
    notes "this is a note"
  end
end
