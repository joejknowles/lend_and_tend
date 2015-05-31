class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :patches, dependent: :destroy
  has_many :patch_images, through: :patches
  has_one :user_avatar, dependent: :destroy

  validates_presence_of :name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  devise(:campaignable) if ENV['RACK_ENV'] == 'production'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do | user |
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end
end
