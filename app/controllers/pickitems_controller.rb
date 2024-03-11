class PickitemsController < ApplicationController
  def index
    @pickitems = Pickitem.all
  end

  def show
    @pickitem = Pickitem.find(params[:id])
  end
end
