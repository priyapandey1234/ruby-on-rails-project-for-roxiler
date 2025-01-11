class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_password
    user = User.find(params[:id])
    if user.update(password: params[:password])
      render json: { message: 'Password updated successfully' }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :password, :role)
  end
end
