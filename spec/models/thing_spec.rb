require "rails_helper"

RSpec.describe Thing, type: :model do
  context "validations" do
    let(:board) { build_stubbed(:board) }
    let(:thing) { build_stubbed(:thing, board: board) }

    it "should have valid factory" do
      expect(thing).to be_valid
    end

    it "should require summary" do
      thing.summary = nil
      expect(thing).to_not be_valid
    end

    it "should require long enough summary" do
      thing.summary = "ab"
      expect(thing).to_not be_valid

      thing.summary = "abc"
      expect(thing).to be_valid
    end

    it "should require type" do
      thing.type = nil
      expect(thing).to_not be_valid
    end

    it "should require board" do
      thing.board = nil
      expect(thing).to_not be_valid
    end
  end
end
