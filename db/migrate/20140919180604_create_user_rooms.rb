class CreateUserRooms < ActiveRecord::Migration
  def change
    create_table :user_rooms do |t|
      t.boolean :has_won, default: false
      t.string :host_id
      t.references :user
		t.references :room
      t.timestamps

    end
  end
end
