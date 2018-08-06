class CreateDinners < ActiveRecord::Migration[5.2]
  def change
    create_table :dinners do |t|
    	t.string :dinner_name, null: false, default: ""
    	t.text :memo
    	t.integer :user_id
    	t.datetime :make_time, null: false
      t.string :slug, null:false
      t.timestamps
    end
  end
end
