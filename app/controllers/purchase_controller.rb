class PurchaseController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      Payjp.api_key = "sk_test_b569733ee02d592036c63273"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
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
    @item = Item.find(params[:item_id])
  end


   private
   def purchase_params
     params.require(:purchase_address).permit(:postcode, :area_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
   end

end
