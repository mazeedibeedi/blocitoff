class ItemsController < ApplicationController
  before_action :set_item, except: [:create]
  def create
    @item = current_user.items.new(item_params)
    if @item.save
      flash[:notice] = "Item was successfully created"
    else
      flash.now[:alert] = "There was an error in creating your item"
    end
    redirect_to current_user
  end

  def update
    @item.completed = params[:completed]
    if @item.save
      flash[:notice] = "You completed an item. Congrats!"
    else
      flash.now[:alert] = "Something went wrong, try again."
    end
    redirect_to current_user
  end

  def destroy
    if @item.destroy
      flash[:notice] = "Item was successfully destroyed"
    else
      flash.now[:alert] = "There was an error in deleting your item"
    end
    redirect_to current_user
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
