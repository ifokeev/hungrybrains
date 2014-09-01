class AddEducationToVacancies < ActiveRecord::Migration
  def change
  change_table :vacancies do |t|
      t.integer :min_grade
      t.text    :instruction
    end
  end
end
