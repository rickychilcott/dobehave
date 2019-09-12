require "rails_helper"

RSpec.describe BoardsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Board. As you add validations to Board, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { email: Faker::Internet.email, vision: "Lorem Ipsum is simply dummy text..." }
  }

  let(:invalid_attributes) {
    { blarg: "yes!" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BoardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Board.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      board = Board.create! valid_attributes
      get :show, params: { id: board.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      board = Board.create! valid_attributes
      get :edit, params: { id: board.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Board" do
        expect {
          post :create, params: { board: valid_attributes }, session: valid_session
        }.to change(Board, :count).by(1)
      end

      it "redirects to the created board" do
        post :create, params: { board: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Board.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { board: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { email: Faker::Internet.email,
          vision: "Optionality" }
      }

      it "updates the requested board" do
        board = create(:board, **valid_attributes)
        put :update, params: { id: board.to_param, board: new_attributes }, session: valid_session

        board.reload
        expect(board.email).to eq(new_attributes.fetch(:email))
        expect(board.vision).to eq(new_attributes.fetch(:vision))
      end

      it "redirects to the board" do
        board = Board.create! valid_attributes
        put :update, params: { id: board.to_param, board: valid_attributes }, session: valid_session
        expect(response).to redirect_to(board)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        board = create(:board, **valid_attributes)
        put :update, params: { id: board.to_param, board: invalid_attributes }, session: valid_session
        expect(response).to redirect_to(board)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested board" do
      board = create(:board, **valid_attributes)
      expect {
        delete :destroy, params: { id: board.to_param }, session: valid_session
      }.to change(Board, :count).by(-1)
    end

    it "redirects to the boards list" do
      board = create(:board, **valid_attributes)
      delete :destroy, params: { id: board.to_param }, session: valid_session
      expect(response).to redirect_to(boards_url)
    end
  end
end
