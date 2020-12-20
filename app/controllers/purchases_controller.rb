class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    sold_out_item
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:telephone_number, :prefecture_id, :municipality, :address_number, :postal_code, :apartment).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token], 
      currency: 'jpy'
      )
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
   end
end
