class ChangeDurationTypeInVacancies < ActiveRecord::Migration
  def change
    change_column :vacancies, :duration, :integer
  end
end
