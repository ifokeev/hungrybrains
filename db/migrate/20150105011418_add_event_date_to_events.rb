class AddEventDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :release_at, :date
    add_column :events, :sort, :integer, :default => 0
  end
end
