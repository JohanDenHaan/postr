class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name
  attr_accessible :provider, :uid #for OmniAuth
  
  # Find user when authenticated via Facebook
  # Create a new user if it doesn't exist already
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    
    unless user
      user = User.create!( name: auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid: auth.uid,
                          email: auth.info.email,
                          password: Devise.friendly_token[0,20]
                        )
    end
    
    return user
  end
  
  # Find user when authenticated via Twitter
  # Create a new user if it doesn't exist already
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    
    unless user
      user = User.create!( name: auth.info.name,
                          provider: auth.provider,
                          uid: auth.uid,
                          email: auth.info.nickname + "@twitter.com", #placeholder for now as Twitter API doesn't expose email TODO rewrite app to not depend on email or let user add it
                          password: Devise.friendly_token[0,20]
                        )
    end
    
    return user
  end
  
end
