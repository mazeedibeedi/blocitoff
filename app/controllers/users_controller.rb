class UsersController < ApplicationController
  def show
    @user = params[:id].present? ? User.find(params[:id]) : current_user
  end
end
