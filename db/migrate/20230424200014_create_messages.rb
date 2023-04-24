class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true, column: :sender_user_id
      t.references :group, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
