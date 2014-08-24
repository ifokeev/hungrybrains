class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :student_id
      t.integer :company_id

      t.timestamps
    end

    add_index :relationships, :student_id
    add_index :relationships, :company_id
    add_index :relationships, [:student_id, :company_id], unique: true    
  end
end
