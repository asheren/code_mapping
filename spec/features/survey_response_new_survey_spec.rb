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

  scenario "A user can see all of their survey responses" do
    sign_in
    survey_response = create(:survey_response, user: User.last)
    survey_response_2 = create(:survey_response, user: User.last, notes: nil)

    visit survey_responses_path
    save_and_open_screenshot

    expect(page.first("tr:nth-of-type(2)")).to have_content(survey_response.created_at.in_time_zone('Eastern Time (US & Canada)').strftime("%b %e, %Y"))
    expect(page.first("tr:nth-of-type(2)")).to have_content(survey_response.perceived_code_confidence)
    expect(page.first("tr:nth-of-type(2)")).to have_content(survey_response.material_difficulty_rating)
    expect(page.first("tr:nth-of-type(2)")).to have_content(survey_response.notes)
    expect(page.last("tr")).to have_content(survey_response.notes)
  end
end
