class PickitemsController < ApplicationController
  before_action :set_shipper_and_pickgroup, only: [:index,:show,:update,:show_by_jan]


  def index
    @pickitems = Pickitem.where(pickgroup: @pickgroup).order(updated_at: :asc, tana: :asc,)
      pickitem = @pickitems.first
      if pickitem.shipper.present?
        
      else
        @pickitems.update_all(shipper: @shipper)
      end
  end

  def show
    @pickitem = Pickitem.find(params[:id])
  end

  def update
    pickitem = Pickitem.find(params[:id])
    pickitem.shipping_records = pickitem_params[:shipping_records]
    pickitem.shipping_datetime = Time.now
    @pickgroup = pickitem.pickgroup
    if pickitem.shipping_records.present?
      pickitem.update(pickitem_params)
    else
      pickitem.update(pickitem_params.merge(shipping_records: pickitem.totalpick))
    end
    redirect_to pickitems_path(pickgroup: @pickgroup)
  end

  def show_by_jan
    jan = params[:content]
    @pickitem = Pickitem.find_by(jan: jan)
    @pickitem.shipper = @shipper
    @pickitem.pickgroup = @pickgroup
    if @pickitem
      redirect_to pickitem_path(@pickitem)
    else
      flash[:alert] = "該当する商品が見つかりませんでした"
      redirect_to pickitems_path
    end
  end

  private
  def pickitem_params
    params.require(:pickitem).permit(:shipper, :shipping_records, :shipping_datetime)
  end

  def set_shipper_and_pickgroup
    @shipper = params[:shipper]
    @pickgroup = params[:pickgroup]
  end
end 
