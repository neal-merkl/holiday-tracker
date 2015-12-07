class AddCountryToHolidays < ActiveRecord::Migration
  def change
    add_column :holidays, :country, :string
  end
end
