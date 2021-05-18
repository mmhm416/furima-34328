class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  def index
    @purchase_delivery = PurchaseDelivery.new
  end
end

private

def purchase_params
  params.require(:purchase_delivery).permit(:zip_code, :prefecture_id, :city, :address, :building, :phone_no).merge(
    user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price
  )
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: purchase_params[:price],
    card: purchase_params[:token],
    currency: 'jpy'
  )
end

def set_item
  @item = Item.find(params[:item_id])
end

def move_to_index
  redirect_to root_path if (current_user.id == @item.user_id) || @item.purchase.present?
end
