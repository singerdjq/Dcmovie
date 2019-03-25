class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :image_url
      t.string :name
      t.integer :year
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
