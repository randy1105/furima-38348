class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if Order.exists?(item_id: @item.id) || @item.user.id == current_user.id
        redirect_to root_path
      else
        @order_address = OrderAddress.new
      end
    else
      redirect_to root_path
    end
  end

  def new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      set_pay
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :block, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end
end
