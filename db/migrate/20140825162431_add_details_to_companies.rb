class AddDetailsToCompanies < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.boolean :agency
      t.string  :phone
    end    
  end
end
