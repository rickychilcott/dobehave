require "rails_helper"

RSpec.describe "boards/edit", type: :view do
  before(:each) do
    @board = assign(:board, create(:board))
  end

  it "renders the edit board form" do
    render

    assert_select "form[action=?][method=?]", board_path(@board), "post" do
      assert_select "input[name=?]", "board[email]"
    end
  end
end
