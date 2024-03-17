class PickitemsController < ApplicationController
  def index
    @pickitems = Pickitem.order(updated_at: :asc, tana: :asc,)
  end

  def show
    @pickitem = Pickitem.find(params[:id])
  end

  def update
    pickitem = Pickitem.find(params[:id])
    if pickitem.shipping_records.present?
      pickitem.update(pickitem_params)
    else
      pickitem.update(pickitem_params.merge(shipping_records: pickitem.totalpick))
    end
    redirect_to pickitems_path
  end

  def show_by_jan
    jan = params[:content]
    @pickitem = Pickitem.find_by(jan: jan)
    if @pickitem
      redirect_to pickitem_path(@pickitem)
    else
      flash[:alert] = "該当する商品が見つかりませんでした"
      redirect_to root_path
    end
  end

  private
  def pickitem_params
    params.require(:pickitem).permit(:shipper, :shipping_records, :shipping_datetime)
  end
end 
