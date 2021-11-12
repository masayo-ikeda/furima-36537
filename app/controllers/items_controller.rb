class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
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

# | Column             | Type       | Options                        |
# |--------------------|------------|--------------------------------|
# | user               | references | null: false, foreign_key: true |
# | item               | string     | null: false                    |
# | info               | text       | null: false                    |
# | category_id        | integer    | null: false                    |
# | rank_id            | integer    | null: false                    |
# | postage_id         | integer    | null: false                    |
# | area_id            | integer    | null: false                    |
# | scheduled_id       | integer    | null: false                    |
# | price              | integer    | null: false                    |