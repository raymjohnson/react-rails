require "rails_helper"

RSpec.describe "Delete questions" do
  it "delete a question" do
    visit "/"
    click_link "New Question"
    fill_in "Title", with: "Is Capybara Cool?"
    click_button "Create Rating question"

    within(".flash-notice") do
      expect(page).to have_content("Your question has been created.")
    end
    
    visit "/"
    click_link "Delete"
    
    within(".flash-notice") do
      expect(page).to have_content("Deleted Successfully")
    end
    within(".questions") do
      expect(page).not_to have_content("Is Capybara Cool?")
    end
  end
end
