class PickitemsController < ApplicationController
  before_action :set_shipper_and_pickgroup, only: [:index,:show,:update,:show_by_jan]

  def index
    if session[:pickgroup].nil?
      #@pickgroupはそのまま
    else
      @pickgroup = session[:pickgroup]
      @nouhinbi = session[:nouhinbi]
      @shipper = session[:shipper]
    end
    
    if @pickgroup.present?
      #@pickgroupで条件抽出
      @pickitems = Pickitem.where(pickgroup: @pickgroup, nouhinbi: @nouhinbi, shipper: @shipper).order(updated_at: :asc, tana: :asc)
      pickitem = @pickitems.first
      if pickitem.present? && pickitem.shipper.present?

      else
        Pickitem.where(pickgroup: @pickgroup, nouhinbi: @nouhinbi).update_all(shipper: @shipper)
      end
    else
      #@pickgroupに値がないので全レコード抽出
      @pickitems = Pickitem.all.order(pickgroup: :asc, updated_at: :asc, tana: :asc)
      pickitem = @pickitems.first
      if pickitem.present? && pickitem.shipper.present?

      else
        Pickitem.where(nouhinbi: @nouhinbi).update_all(shipper: @shipper)
      end
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
    @shipper = pickitem.shipper
    @nouhinbi = pickitem.nouhinbi

    if pickitem.shipping_records.present?
      pickitem.update(pickitem_params)
    else
      pickitem.update(pickitem_params.merge(shipping_records: pickitem.totalpick))
    end

    session[:pickgroup] = @pickgroup
    session[:shipper] = @shipper
    session[:nouhinbi] = @nouhinbi
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

  def pickgroups
    nouhinbi = params[:nouhinbi]
    pickgroups = Pickitem.where(nouhinbi: nouhinbi).pluck(:pickgroup).uniq
    @options = pickgroups.map do |group|
      count_for_pickgroup = Pickitem.where(nouhinbi: nouhinbi, pickgroup: group).count
      [group, count_for_pickgroup]
    end
    render json: @options #[ピッキングNo, 行数]の配列でjsへ渡す
  end

  private
  def pickitem_params
    params.require(:pickitem).permit(:shipper, :shipping_records, :shipping_datetime, :pickgroup, :nouhinbi)
  end

  def set_shipper_and_pickgroup
    @shipper = params[:shipper]
    @pickgroup = params[:pickgroup]
    @nouhinbi = params[:nouhinbi]
  end
end 
