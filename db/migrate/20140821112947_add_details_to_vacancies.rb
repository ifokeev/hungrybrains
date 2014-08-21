class AddDetailsToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :duration, :datetime
    add_column :vacancies, :location, :string, default: "Москва"
    add_column :vacancies, :worktype, :integer, default: 0
    add_column :vacancies, :salaryfrom, :integer
    add_column :vacancies, :salaryto, :integer
    add_column :vacancies, :status, :integer, default: 1
    add_column :vacancies, :deadline, :datetime
  end
end
