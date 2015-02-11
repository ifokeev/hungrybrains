class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.attachment :image
      t.string :title
      t.text :preview
      t.text :txt
      t.boolean :published

      t.timestamps
    end
  end
end
