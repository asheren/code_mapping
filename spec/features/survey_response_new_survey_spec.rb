require "rails_helper"

feature "Submitting a new code confidence survey" do
  scenario "A user can enter in a number for perceived code confidence" do
    user = create(:user)
    #sign_in user
    save_and_open_screenshot
    visit new_survey_response_path

    expect(page).to have_content("How confident am I")

    select "5", :from => "perceived_code_confidence"

    expect(page).to have_content("5")
  end

  scenario "A user can enter in a number for material difficulty rating" do
    user = create(:user)
    sign_in user
    visit new_survey_response_path

    expect(page).to have_content("How difficult is")

    select "2", :from => "material_difficulty_rating"

    expect(page).to have_content("2")
    # survey_response = user.surveys_responses.last
    # expect(survey_response.material_difficulty_rating).to eq 2
  end

  scenario "A user can add notes if they would like" do
    user = create(:user)
    sign_in user
    visit new_survey_response_path

    expect(page).to have_content("Notes")

    fill_in :notes, with: "Today my teammates were supportive and positive."

  end

  scenario "A user can submit the survey"
end
