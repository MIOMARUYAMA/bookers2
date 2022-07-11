class Book < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user

  def get_profile_image(width,height)
  unless profile_image.attached?
    file_path= Rails.root.join('app/assets/images/tulip.jpeg')
     profile_image.attach(io: File.open(file_path), filename: 'tulip.jpeg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end

  validates :body, presence: true
  validates :title, presence: true
  validates_length_of :body, maximum: 200

end
