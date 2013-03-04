class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :user
      t.references :chat

      t.timestamps
    end
    
    add_index :participants, :user_id
    add_index :participants, :chat_id
  end
end
