class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :fname
      t.string :category
      t.string :thumbnail
      t.string :caption

      t.timestamps
    end
  end
end
