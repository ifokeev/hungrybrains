class AddBriefDescriptionToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :brief_description, :string
  end
end
