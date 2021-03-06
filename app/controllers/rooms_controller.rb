class RoomsController < ApplicationController
	before_action :set_room, only: [:show, :update, :destroy]
	before_action :render_main_layout_if_format_html

	respond_to :json, :html

  def index
  	# respond_with (@rooms = Room.all())
  	# respond_with UserRoom.all.to_json(:include => [:users, :room])
  	respond_with Room.all.to_json(:include => [:users, :user_room])
  end

  def create
  	user = User.find(params[:user_id])
  	room = user.rooms.create(room_params)

  	puts "adding host_id to join table"
  	user_room = UserRoom.find_by_room_id(room.id)
  	user_room.host_id = user.id
  	user_room.save
  	puts "done adding host_id to join table"

  	respond_with room
  end

  def info
  	@room = Room.find(params[:room_id])
  	# respond_with @room.users
    respond_with @room.to_json(:include => [:users, :user_room])
  end

  def join
  	@user_id = User.find(params[:user_id])
  	@room_id = Room.find(params[:room_id])
    @host_id = params.require(:host).permit(:host_id)
  	respond_with @room_id.users << @user_id
    # UserRoom.where(:room_id => @room).update_all(host_id: @host_id)
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
