class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  validate :max_image_count

  def max_image_count
    if imageable.images.count == 1
      errors.add(:base, "Already have maximum number of images")
    end
  end
end
