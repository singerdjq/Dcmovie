class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :name
      t.integer :year
      t.integer :nominations
      t.float :rating
      t.string :genre1
      t.string :genre2
      t.string :release
      t.string :synopsis

      t.timestamps
    end
  end
end
