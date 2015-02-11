class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.attachment :image
      t.string :title
      t.text :preview
      t.text :txt
      t.boolean :published, :default => true

      t.timestamps
    end
  end
end
