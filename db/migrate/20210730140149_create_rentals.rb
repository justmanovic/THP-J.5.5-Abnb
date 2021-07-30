class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.belongs_to :accomodation, index: true
      t.belongs_to :guest, index: true
      t.timestamps
    end
  end
end
