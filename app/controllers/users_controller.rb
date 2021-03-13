class UsersController < ApplicationController

	skip_before_action :authenticate_request, only: [:create]

	def create
		user = User.create!(user_params)
		render json: { status: 'success'}
	end	

	private

	def user_params
  	 params.require(:user).permit(:name, :email, :password)
  end		
end