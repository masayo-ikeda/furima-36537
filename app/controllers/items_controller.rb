class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  #authenticate_user!メソッドはログインに必要なデバイス
  #ユーザがログインしているかどうかを確認し、ログインしていない場合はユーザをログインページにリダイレクトする
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :login_confirmation, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.order("created_at DESC")
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

  def show
  end

  def edit
  end

    def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :info, :category_id, :image, :rank_id, :postage_id, :area_id, :scheduled_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def login_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end