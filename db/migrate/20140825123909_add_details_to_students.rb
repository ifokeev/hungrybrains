#encoding: utf-8
class AddDetailsToStudents < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.string  :surname
      t.string  :alias,    unique: true
      t.string  :location, default: "Москва"
      t.string  :university
      t.integer :grade
      t.date    :graduation
      t.integer :experience
      t.string  :work
      t.integer :language, default: 0
      t.text    :description
    end
  end
end
