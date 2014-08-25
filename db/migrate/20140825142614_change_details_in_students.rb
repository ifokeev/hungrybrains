class ChangeDetailsInStudents < ActiveRecord::Migration
  def change
    change_column :students, :experience, :integer, default: 0
    change_column :students, :graduation, :integer
  end
end
