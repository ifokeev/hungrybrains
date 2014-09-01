class FixDatesInVacancies < ActiveRecord::Migration
  def change
    change_column :vacancies, :duration, :date
    change_column :vacancies, :deadline, :date
  end
end
