require "rails_helper"

feature "Submitting a new code confidence survey", js: true do
  scenario "A user can enter in a number for perceived code confidence" do
    sign_in

    visit new_survey_response_path

    expect(page).to have_content("How confident am I")

    select "5", :from => "How confident am I"

    expect(page).to have_content("5")
  end

  scenario "A user can enter in a number for material difficulty rating" do
    sign_in
    visit new_survey_response_path

    expect(page).to have_content("How difficult is")

    select "5", :from => "How confident am I"
    select "2", :from => "How difficult is"

    click_button "Submit"

    survey_response = SurveyResponse.last
    expect(survey_response.material_difficulty_rating).to eq 2
  end

  scenario "A user can add notes if they would like" do
    sign_in
    visit new_survey_response_path

    expect(page).to have_content("Notes")

    select "5", :from => "How confident am I"
    select "2", :from => "How difficult is"
    fill_in :Notes, with: "Today my teammates were supportive and positive."

    click_button "Submit"

    survey_response = SurveyResponse.last
    expect(survey_response.notes).to eq("Today my teammates were supportive and positive.")
  end

  scenario "A user can submit the survey" do
    sign_in
    visit new_survey_response_path

    select "5", :from => "How confident am I"
    select "2", :from => "How difficult is"
    fill_in :Notes, with: "Today my teammates were supportive and positive."

    click_button "Submit"

    expect(page).to have_content("Index")
  end
end
