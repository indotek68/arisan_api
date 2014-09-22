class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :image_url
      t.string :email
      t.string :password_digest
      t.text :description
      t.date :age
      t.boolean :host, default: false
      t.integer :reputation, default: 0

      t.timestamps
    end
  end
end
