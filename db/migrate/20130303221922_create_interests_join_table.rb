class CreateInterestsJoinTable < ActiveRecord::Migration
  def change
    create_table :interests, :id => false do |t|
      t.references :language
      t.references :user
    end

    add_index :interests, :language_id
    add_index :interests, :user_id
  end
end
