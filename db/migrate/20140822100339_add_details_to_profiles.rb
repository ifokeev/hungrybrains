#encoding: utf-8
class AddDetailsToProfiles < ActiveRecord::Migration
  def change
    change_table :profiles do |t|
      t.string :site
      t.string :location, default: "Москва"
      t.text :description
      t.integer :employees
    end
  end
end
