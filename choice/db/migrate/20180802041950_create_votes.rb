class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :dinner_id
      t.string :vote_area_name
      t.string :vote_genre_name
      t.string :vote_name
      t.boolean :attend, default: true
      t.integer :budget_id
      t.timestamps
    end
  end
end
