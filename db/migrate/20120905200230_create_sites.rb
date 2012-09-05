class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :slug
      t.integer :user_id

      t.timestamps
    end
  end
end
