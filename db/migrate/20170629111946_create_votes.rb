class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :score, null: false
      t.integer :user_id, null: false
      t.references :voteable, polymorphic: true
      t.timestamps
    end
  end
end
