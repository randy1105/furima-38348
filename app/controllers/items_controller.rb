class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :user_same, only: [:edit, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if Order.exists?(item_id: @item.id)
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def user_same
    if user_signed_in?
      redirect_to action: :index unless @item.user.id == current_user.id
    else
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :category_id, :status_id, :freight_id,
                                 :shipping_prefecture_id, :ship_date_id, :price).merge(user_id: current_user.id)
  end
end
