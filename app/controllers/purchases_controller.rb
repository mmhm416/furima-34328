class PurchasesController < ApplicationController

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  def index
    @purchase_delivery = PurchaseDelivery.new
    @item = Item.find(params[:item_id])
  end

end

private
def purchase_params
  params.require(:purchase_delivery).permit(:zip_code, :prefecture_id, :city, :address, :building, :phone_no).merge(user_id: current_user.id, item_id: params[:item_id])
end