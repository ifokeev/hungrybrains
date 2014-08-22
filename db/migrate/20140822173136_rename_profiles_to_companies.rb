class RenameProfilesToCompanies < ActiveRecord::Migration
  def change
    rename_table :profiles, :companies
  end
end
