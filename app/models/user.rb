class User < ApplicationRecord

  has_one_attached :profile_image

  has_many :books, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

def get_profile_image(width,height)
  unless profile_image.attached?
    file_path= Rails.root.join('app/assets/images/tulip.jpeg')
    profile_image.attach(io: File.open(file_path), filename: 'tulip.jpeg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
end

validates :name, uniqueness: true
validates :name, length: { in: 2..20 }
validates_length_of :introduction, maximum: 50
end
