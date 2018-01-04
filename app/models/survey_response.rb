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

class SurveyResponse < ApplicationRecord
  validates :perceived_code_confidence, presence: true, inclusion: { in: 1..10,
    message: "%{value} must be an integer from 1 to 10" }
  validates :material_difficulty_rating, presence: true, inclusion: { in: 1..10,
    message: "%{value} must be an integer from 1 to 10" }
end
