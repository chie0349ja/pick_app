# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

#csvファイルのパス
csv_file_path = '/mnt/c/Users/momoc/OneDrive/デスクトップ/オムニ集品リスト/pickdata.csv'

#CSV.foreach(csv_file_path, col_sep: ',') do |row|
#  puts "1: #{row[0]}, 2: #{row[1]}, 3: #{row[2]}, 4: #{row[3]}, 5: #{row[4]}"
#end

seaquence_number = 1

CSV.foreach(csv_file_path, col_sep: ',', headers: true) do |row|
  Pickitem.create(
    no:    seaquence_number,
    nouhinbi:   row[0].to_s,
    tana:       row[1].to_s,
    zone:       row[2].to_s,
    rack:       row[3].to_s,
    dan:        row[4].to_s,
    koma:       row[5].to_s,
    shohincd:   row[6].to_s,
    jan:        row[7].to_s,
    shohinmei:  row[8].to_s,
    mklot:      row[9].to_i,
    sejlot:     row[10].to_i,
    minorder:   row[11].to_i,
    pick01:     row[12].to_i,
    pick02:     row[13].to_i,
    pick03:     row[14].to_i,
    totalpick:  row[17].to_i,
    pickgroup:  row[18].to_i
  )
  seaquence_number += 1
end