class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def dashboard
    @total_users = User.count
    @total_stores = Store.count
    @total_ratings = Rating.count
  end

  def manage_users
    @users = User.all
  end

  def manage_stores
    @stores = Store.all
  end

  private

  def authorize_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user.has_role?(:admin)
  end
end
