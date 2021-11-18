class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  #authenticate_user!メソッドはログインに必要なデバイス
  # プロトスペース
  # before_action :set_prototype, except: [:index, :new, :create]
  #deviseのメソッド
  #ユーザがログインしているかどうかを確認し、ログインしていない場合はユーザをログインページにリダイレクトする
  # before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
  end
  private

  def item_params
    params.require(:item).permit(:item, :info, :category_id, :image, :rank_id, :postage_id, :area_id, :scheduled_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @items = Item.find(params[:id])
  end
end