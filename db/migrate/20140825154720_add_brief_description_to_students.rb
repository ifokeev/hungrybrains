class AddBriefDescriptionToStudents < ActiveRecord::Migration
  def change
    add_column :students, :brief_description, :string
  end
end
