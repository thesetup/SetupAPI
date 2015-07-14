class Video < ActiveRecord::Base
  belongs_to :videoable, polymorphic: true
  belongs_to :profile
  has_one :caption
  has_one :thumbnail
end
