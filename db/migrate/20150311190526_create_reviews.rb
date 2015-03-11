class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :venue_id
      t.integer :user_id
      t.text :review_body
      t.integer :rating

      t.timestamps
    end
  end
end
