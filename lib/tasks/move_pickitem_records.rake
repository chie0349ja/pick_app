namespace :db do
  desc "Move records from pickitems to pickitems_olds"
  task :move_pickitem_records => :environment do
    Pickitem.transaction do
      Pickitem.all.each do |pickitem|
        PickitemOld.create!(
          no: pickitem.no,
          nouhinbi: pickitem.nouhinbi,
          tana: pickitem.tana,
          zone: pickitem.zone,
          rack: pickitem.rack,
          dan: pickitem.dan,
          koma: pickitem.koma,
          shohincd: pickitem.shohincd,
          jan: pickitem.jan,
          shohinmei: pickitem.shohinmei,
          mklot: pickitem.mklot,
          sejlot: pickitem.sejlot,
          minorder: pickitem.minorder,
          pick01: pickitem.pick01,
          pick02: pickitem.pick02,
          pick03: pickitem.pick03,
          totalpick: pickitem.totalpick,
          pickgroup: pickitem.pickgroup,
          shipper: pickitem.shipper,
          shipping_records: pickitem.shipping_records,
          shipping_datetime: pickitem.shipping_datetime
        )
      end
      #Pickitmテーブルレコードを空にする
      Pickitem.delete_all
    end
  end
end