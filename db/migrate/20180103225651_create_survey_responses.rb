class CreateSurveyResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_responses do |t|
      t.integer :perceived_code_confidence, null: false
      t.integer :material_difficulty_rating, null: false
      t.text :notes

      t.timestamps
    end
  end
end
