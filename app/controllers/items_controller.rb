class ItemsController < ApplicationController
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :category_id, :status_id, :freight_id,
                                 :shipping_prefecture_id, :ship_date_id, :price).merge(user_id: current_user.id)
  end
end
