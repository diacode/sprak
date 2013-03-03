class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :session_id
      t.references :creator

      t.timestamps
    end
    
    add_index :chats, :creator_id
  end
end
