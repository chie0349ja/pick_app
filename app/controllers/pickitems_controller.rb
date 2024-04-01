class PickitemsController < ApplicationController
  before_action :set_shipper_and_pickgroup, only: [:index,:show,:update,:show_by_jan]


  def index
    if session[:pickgroup] .nil?
      #@pickgroupはそのまま
    else
      @pickgroup = session[:pickgroup]
    end
    
    if @pickgroup.present?
      #@pickgroupで条件抽出
      @pickitems = Pickitem.where(pickgroup: @pickgroup).order(updated_at: :asc, tana: :asc)
      pickitem = @pickitems.first
    else
      #@pickgroupに値がないので全レコード抽出
      @pickitems = Pickitem.all.order(pickgroup: :asc, updated_at: :asc, tana: :asc)
      pickitem = @pickitems.first
    end
    if pickitem.shipper.present?
      
    else
      @pickitems.update_all(shipper: @shipper)
    end
    #session[:pickgroup] = nil #こうすると次に更新ボタンを押すと@pickgroup.present?がfalseとなる
    #session[:shipper] = nil   
  end

  def show
    @pickitem = Pickitem.find(params[:id])
  end

  def update
    pickitem = Pickitem.find(params[:id])
    pickitem.shipping_records = pickitem_params[:shipping_records]
    pickitem.shipping_datetime = Time.now
    @pickgroup = pickitem.pickgroup
    @shipper = pickitem.shipper

    if pickitem.shipping_records.present?
      pickitem.update(pickitem_params)
    else
      pickitem.update(pickitem_params.merge(shipping_records: pickitem.totalpick))
    end

    session[:pickgroup] = @pickgroup
    session[:shipper] = @shipper
    redirect_to pickitems_path
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
    params.require(:pickitem).permit(:shipper, :shipping_records, :shipping_datetime, :pickgroup)
  end

  def set_shipper_and_pickgroup
    @shipper = params[:shipper]
    @pickgroup = params[:pickgroup]
  end
end 
