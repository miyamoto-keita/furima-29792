class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render 'new'
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      @item.update(item_params)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :description, :category_id, :status_id, :delivery_charge_id, :area_id, :delivery_date_id).merge(user_id: current_user.id)
  end
end
