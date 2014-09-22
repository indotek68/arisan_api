class UsersController < ApplicationController
	before_action :set_user, only: [:show, :update, :destroy]
	before_action :render_main_layout_if_format_html

	respond_to :json, :html

  def index
  	respond_with (@users = User.all)
  end

  def new
    respond_with User.new
    # respond_with User.create(user_params)
  end

  def create
  	# respond_with User.create(params)
    # binding.pry
    respond_with User.create(user_params)
  end

  def show
  	respond_with @user
  end

  def update
  	respond_with @user.update(user_params)
  end

  def destroy
  	respond_with @user.destroy
  end

private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.fetch(:user, {}).permit(:firstname, :lastname, :image_url, :email, :password, :description, :age, :host, :reputation)
    # params.require(:user).permit(:firstname, :lastname, :image_url, :email, :password, :description, :age, :host, :reputation)
  end

	def render_main_layout_if_format_html
		if request.format.symbol == :html
		  render "layouts/application"
		end
	end	
end
