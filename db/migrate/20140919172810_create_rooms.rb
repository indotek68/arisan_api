class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :rm_name
      t.integer :num_people
      t.integer :cash_pot
      t.string :schedule
      t.datetime :startdate

      t.timestamps
    end
  end
end
