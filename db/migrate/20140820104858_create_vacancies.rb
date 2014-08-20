class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.references :profile, index: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
