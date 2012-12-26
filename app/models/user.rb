class User < ActiveRecord::Base
  attr_accessible :description, :favourites_count, :followers_count, :friends_count, :id, :image, :lang, :listed_count, :location, :name, :screen_name, :statuses_count, :time_zone, :twitter_id, :url
end
