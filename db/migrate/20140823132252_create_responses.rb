class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :vacancy_id
      t.integer :student_id
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
