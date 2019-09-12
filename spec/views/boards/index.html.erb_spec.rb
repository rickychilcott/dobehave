require "rails_helper"

RSpec.describe "boards/index", type: :view do
  before(:each) do
    assign(:boards, create_list(:board, 2, email: "ricky@missionmet.com"))
  end

  it "renders a list of boards" do
    render
    assert_select "tr>td", :text => "ricky@missionmet.com".to_s, :count => 2
  end
end
