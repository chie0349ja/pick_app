class PickitemsController < ApplicationController
  def index
    @pickitems = Pickitem.all
  end
end
