class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)
    if @item.save
      flash[:notice] = "Item was successfully created"
    else
      flash.now[:alert] = "There was an error in creating your item"
    end
    redirect_to current_user
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
