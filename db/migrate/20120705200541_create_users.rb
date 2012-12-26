class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :image
      t.string :location
      t.string :id
      t.string :url
      t.integer :followers_count
      t.string :screen_name
      t.integer :listed_count
      t.integer :favourites_count
      t.string :lang
      t.text :description
      t.string :time_zone
      t.integer :friends_count
      t.integer :statuses_count

      t.timestamps
    end
  end
end
