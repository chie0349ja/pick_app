class PickitemsController < ApplicationController
  def index
    @pickitems = Pickitem.all
  end

  def show
    @pickitem = Pickitem.find(params[:id])
  end

  def update
    pickitem = Pickitem.find(params[:id])
    binding.pry
    pickitem.update(pickitem_params)
  end

  private
  def pickitem_params
    params.require(:pickitem).permit(:pickitem_id, :shipper, :shipping_records, :shipping_datetime)
  end
end 
