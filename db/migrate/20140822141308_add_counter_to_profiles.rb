class AddCounterToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :vacancies_count, :integer
  end
end
