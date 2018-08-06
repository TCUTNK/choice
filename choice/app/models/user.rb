class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  #   def self.find_for_oauth(auth)
  #   user = User.where(uid: auth.uid, provider: auth.provider).first

  #   unless user
  #     user = User.create(
  #       uid:      auth.uid,
  #       provider: auth.provider,
  #       email:    auth.info.email,
  #       password: Devise.friendly_token[0, 20]
  #     )
  #   end

  #   user
  # end
  def self.find_for_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new(
        :name => auth.extra.raw_info.name,
        :provider => auth.provider,
        :uid => auth.uid,
        :email => auth.info.email,

        :password => Devise.friendly_token[0, 20],
      )
      user.save(:validate => false)
    end
    user
end
#   def self.from_omniauth(auth)
#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#     user.email = auth.info.email
#     user.password = Devise.friendly_token[0,20]
#     user.name = auth.info.name   # assuming the user model has a name
#     user.image = auth.info.image # assuming the user model has an image
#     # If you are using confirmable and the provider(s) you use validate emails, 
#     # uncomment the line below to skip the confirmation emails.
#     # user.skip_confirmation!
#   end
# end
  has_many :dinners
  has_many :votes
end
