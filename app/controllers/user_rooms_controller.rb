class UserRoomsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
	before_action :render_main_layout_if_format_html

	respond_to :json, :html

  def index
  	respond_with (@user_room = User_room.all)
  end

  def update
  	respond_with @room.update(host_params)
  end

  def has_won
  	respond_with @room.update(won_params)
  end

private
	def room
		@room = Room.find_by_room_id(params[:id])
	end

	def host_params
		params.require().permit(:host_id)
	end

	def won_params
		params.require().permit(:has_won)
	end

	def render_main_layout_if_format_html
		if request.format.symbol == :html
		  render "layouts/application"
		end
	end	
end
