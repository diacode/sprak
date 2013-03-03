class AddNativeLanguageIdColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :native_language_id, :integer
    add_index :users, :native_language_id
  end
end
