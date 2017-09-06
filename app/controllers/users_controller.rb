class UsersController < ApplicationController
  def show
    @user = params[:id].present? ? User.find(params[:id]) : current_user
    @pending_items = @user.items.where(completed: false)
    @completed_items = @user.items.where(completed: true)
  end
end
