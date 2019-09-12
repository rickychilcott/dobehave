require 'rails_helper'

RSpec.feature "CreateBoards", type: :feature do
  it "can create a board, with email" do
    visit root_url

    click_on "Create a new board"
    fill_in "board[email]", with: "ricky@rickychilcott.com"
    click_button

    expect(page).to have_content("Email: ricky@rickychilcott.com")
    expect(page).to have_content("Do")
    expect(page).to have_content("Be")
    expect(page).to have_content("Have")
  end
end
