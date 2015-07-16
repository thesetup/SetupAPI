class Video < ActiveRecord::Base
  belongs_to :videoable, polymorphic: true

  # validate :max_video_count, :on => :create_video

  # def max_video_count
  #   if videoable.videos.count == 4
  #     errors.add(:base, "Already have maximum number of videos")
  #   end
  # end
end
