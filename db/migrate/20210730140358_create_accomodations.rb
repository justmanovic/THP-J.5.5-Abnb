class CreateAccomodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accomodations do |t|
      t.integer :available_beds
      t.integer :price_per_night
      t.text :description
      t.boolean :has_wifi
      t.text :welcome_message
      t.belongs_to :town, index:true
      t.belongs_to :host, index:true
      t.timestamps
    end
  end
end
