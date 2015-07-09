class Application < ActiveRecord::Base
  has_many :videos, as: :videoable
  has_many :images, as: :imageable
  belongs_to :user_id
  belongs_to :profilee_id
end
