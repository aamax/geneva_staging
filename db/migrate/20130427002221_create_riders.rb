class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.integer :event_id
      t.string :name
      t.string :horse
      t.text :status
      t.string :dressage
      t.string :xcountry

      t.timestamps
    end
  end
end
