class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.references :company, index: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
