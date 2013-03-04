class AddCountryCodeToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :country_code, :string
  end
end
