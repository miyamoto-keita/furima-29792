class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def destroy
       @item.destroy
       redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :description, :category_id, :status_id, :delivery_charge_id, :area_id, :delivery_date_id).merge(user_id: current_user.id)
  end

  def set_user
    @item = Item.find(params[:id])
  end
end
