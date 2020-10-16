class PurchaseController < ApplicationController
  before_action :item_set, only: [:index,:create]
  before_action :authenticate_user!
  def create
    
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end 
    
  end

  def index
    @purchase_address = PurchaseAddress.new
    
  end


   private
   def purchase_params
     params.require(:purchase_address).permit(:postcode, :area_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
   end
   def item_set
    @item = Item.find(params[:item_id])
end
end
