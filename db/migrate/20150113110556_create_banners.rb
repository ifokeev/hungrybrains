class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.text :code
      t.integer :position
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
