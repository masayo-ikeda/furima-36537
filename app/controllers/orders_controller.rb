class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @pay = Pay.new
    redirect_to root_path if current_user == @item.user
    # ログインしてる人と@item投稿した人が一致しているならばTOPページへ行く
    redirect_to root_path if @item.order.present?
    # 購入履歴が存在しているならば、購入されてるならばTOPページへいく
  end

  def create
    @pay = Pay.new(order_params)
    if @pay.valid?
      pay_item
      @pay.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
  # ネストしてあるのでparams[:item_id]になる


  def order_params
    params.require(:pay).permit(:code, :area_id, :city, :number, :building, :tel).merge(user_id: current_user.id,
                                                                                        item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end