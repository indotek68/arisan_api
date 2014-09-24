class RoomsController < ApplicationController
	before_action :set_room, only: [:show, :update, :destroy]
	before_action :render_main_layout_if_format_html

	respond_to :json, :html

  def index
  	respond_with (@rooms = Room.all())
  end

  def create
  	user = User.find(params[:user_id])
  	respond_with user.rooms.create(room_params)
  end

  def info
  	@room = Room.find(params[:room_id])
  	respond_with @room.users
  end

  def join
  	@user = User.find(params[:user_id])
  	@room = Room.find(params[:room_id])
  	respond_with @room.users << @user
  end

  def show
  	respond_with @room
  end

  def update
  	respond_with @room.update(room_params)
  end

  def destroy
  	respond_with @room.destroy
  end

private
	def set_room
		@room = Room.find(params[:id])
	end

	def room_params
		params.fetch(:room, {}).permit(:rm_name, :num_people, :cash_pot, :schedule, :startdate)
	end

	def render_main_layout_if_format_html
	# check the request format
		if request.format.symbol == :html
		  render "layouts/application"
		end
	end
end
