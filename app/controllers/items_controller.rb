class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
    # Qiita参照
    # @items = Item.find(params[:name_id])
    # @items_img = @items.item_imgs.find(params[:id])
    # @sending_destination = current_user.sending_destination
    # prefecture = Prefecture.data.select{|o| o[:id] == @sending_destination.prefecture_id}.first
    # @prefectureName = prefecture[:name]
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :info, :category_id, :image, :rank_id, :postage_id, :area_id, :scheduled_id, :price).merge(user_id: current_user.id)
  end
end