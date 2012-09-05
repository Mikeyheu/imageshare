class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :slug
      t.integer :site_id

      t.timestamps
    end
  end
end
