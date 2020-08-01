class CreateReviewandRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :reviewand_ratings do |t|
      t.string :name
      t.string :user_id
      t.string :rating
      t.text :review

      t.timestamps
    end
  end
end
