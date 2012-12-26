require "net/http"
require "uri"

module Twitter

  # ...
  def Twitter.get_user_by_screen_name(screen_name)
    #TODO validate screen_name

    uri = URI.parse("https://api.twitter.com/1/users/show.json?screen_name=#{screen_name}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    return response.body
  end

  # ...
  def Twitter.get_user_by_id(twitter_id)
    uri = URI.parse("https://api.twitter.com/1/users/show.json?user_id=#{twitter_id}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    return response.body
  end

  # ...
  def Twitter.reload_user(user)
    raise "user should be of type User" unless user.is_a?(User)
      
    tweep_hash = Twitter.get_user_by_screen_name(user.screen_name)
    tweep_obj = ActiveSupport::JSON.decode(tweep_hash)

    user.attributes = {
      :twitter_id => tweep_obj["id_str"],
      :name => tweep_obj["name"],
      :description => tweep_obj["description"],
      :image => tweep_obj["profile_image_url"],
      :url => tweep_obj["url"],
      :location => tweep_obj["location"],
      :time_zone => tweep_obj["time_zone"],
      :lang => tweep_obj["lang"],
      :favourites_count => tweep_obj["favourites_count"],
      :followers_count => tweep_obj["followers_count"],
      :friends_count => tweep_obj["friends_count"],
      :listed_count => tweep_obj["listed_count"],
      :statuses_count => tweep_obj["statuses_count"]
    }
    user.save

    return user 
  end

  # ...
  def Twitter.get_friends(twitter_id)
    uri = URI.parse("https://api.twitter.com/1/friends/ids.json?cursor=-1&user_id=#{twitter_id}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    return response.body
  end

end
