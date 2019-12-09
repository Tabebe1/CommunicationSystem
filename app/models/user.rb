class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, presence: true

  has_many :room_messages,
           dependent: :destroy

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male2-512.png"
  end
end
