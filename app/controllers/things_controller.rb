class ThingsController < ApplicationController
    # GET /boards/:board_id/things/new
    def new
      @board = Board.find(params[:board_id])
      type = params[:type] || "do"
      @thing = Thing.new(board: @board, type: type)
      render plain: params.inspect + @thing.inspect
    end
    
    # POST /boards/:board_id/things
    def create
    end
end