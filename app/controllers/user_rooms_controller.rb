class UserRoomsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
	before_action :render_main_layout_if_format_html

	respond_to :json, :html

  def index
  	respond_with (@user_room = UserRoom.all)
  end

  def current_room 
  	user = User.find(params[:host_id])
  	respond_with user.rooms.to_json(:include => [:users, :user_room => {:only => [:host_id]}])

  	#@current_user = UserRoom.where(user_id: params[:host_id])
  	# respond_with @current_user.all.to_json(:include => [:room])
  	# format.json {render :json => @company, :include => [:user, :jobs => {:include => {:skills => {:only => [:id, :name]}}}]}
  	#format.json {render :json => @current_user, :include => [:room => {:include => :user}]}
  	# respond_with @current_user.all.to_json.includes(posts: [{ comments: :guest }, :tags]).find(1)
  	# respond_with @current_user.all.to_json.includes(rooms: [{:room}]])

  	# format.json {render :json => @company, :include => [:user, :jobs => {:include => {:skills => {:only => [:id, :name]}}}]}
  end

  def host
  	respond_with @room.update(host_params)
  end

  def has_won
  	respond_with @find.update(won_params)
  end

private
	def room
		@room = UserRoom.find_by_room_id(params[:room_id])
	end

	def user
		@user = UserRoom.find_by_user_id(params[:user_id])
	end

	def find
		@find = UserRoom.where(["room_id = ? and user_id = ?", @room, @user])
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
