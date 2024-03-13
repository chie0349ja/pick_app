class PickitemsController < ApplicationController
  def index
    @pickitems = Pickitem.all
  end

  def show
    @pickitem = Pickitem.find(params[:id])
  end

  def update
    pickitem = Pickitem.find(params[:id])
    pickitem.update(pickitem_params)
    redirect_to pickitems_path
  end

  private
  def pickitem_params
    params.require(:pickitem).permit(:shipper, :shipping_records, :shipping_datetime)
  end
end 
