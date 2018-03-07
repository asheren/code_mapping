class AddUserToSurveyResponses < ActiveRecord::Migration[5.0]
  def change
    add_reference :survey_responses, :user, index: true
  end
end
