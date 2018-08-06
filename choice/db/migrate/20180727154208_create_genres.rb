class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
    	t.string :genre_name, null: false
    	t.integer :dinner_id, null: false
      t.timestamps
    end
  end
end
