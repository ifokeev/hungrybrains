class AddIndexesToResponses < ActiveRecord::Migration
  def change
    add_index :responses, :vacancy_id
    add_index :responses, :student_id
    add_index :responses, [:vacancy_id, :student_id], unique: true
  end
end
