class Caption < ActiveRecord::Base
  belongs_to :video

  # We may need to state belongs_to profile, through: :video ??
end
