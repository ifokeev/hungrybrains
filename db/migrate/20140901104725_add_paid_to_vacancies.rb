class AddPaidToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :paid, :boolean
  end
end
