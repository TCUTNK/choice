class AddSlugToPosts < ActiveRecord::Migration[5.2]
  def change
       add_index :dinners, :slug, unique: true
  end
end
