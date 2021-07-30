class CreateTowns < ActiveRecord::Migration[5.2]
  def change
    create_table :towns do |t|
      t.string :name
      t.string :zip_code

      t.timestamps
    end
  end
end
