require "rails_helper"

RSpec.describe "Shows a question" do
  it "shows a question" do
    visit "/"
    click_link "New Question"
    fill_in "Title", with: "Is Capybara Cool?"
    click_button "Create Rating question"

    within(".flash-notice") do
      expect(page).to have_content("Your question has been created.")
    end

    expect(page).to have_content("Is Capybara Cool?")
  end
end
