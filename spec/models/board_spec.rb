require "rails_helper"

RSpec.describe Board, type: :model do
  context "validations" do
    let(:board) { build_stubbed(:board) }

    it "should have valid factory" do
      expect(board).to be_valid
    end

    it "should require email" do
      board.email = nil
      expect(board).to_not be_valid
    end

    it "should require legit email" do
      board.email = "hmm@"
      expect(board).to_not be_valid
    end
  end
end
