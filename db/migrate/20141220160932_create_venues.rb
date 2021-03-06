class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.boolean :free_wifi
      t.boolean :charging
      t.string :website
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
