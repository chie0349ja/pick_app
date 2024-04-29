class CreatePickitemOlds < ActiveRecord::Migration[7.0]
  def change
    create_table :pickitem_olds do |t|
      t.integer :no
      t.string :nouhinbi
      t.string :tana
      t.string :zone
      t.string :rack
      t.string :dan
      t.string :koma
      t.string :shohincd
      t.string :jan
      t.string :shohinmei
      t.integer :mklot
      t.integer :sejlot
      t.integer :minorder
      t.integer :pick01
      t.integer :pick02
      t.integer :pick03
      t.integer :totalpick
      t.integer :pickgroup
      t.string  :shipper
      t.integer  :shipping_records
      t.datetime  :shipping_datetime
      t.timestamps
    end
  end
end
