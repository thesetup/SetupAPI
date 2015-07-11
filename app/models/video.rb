class Video < ActiveRecord::Base
  belongs_to :videoable, polymorphic: true
  belongs_to :profile

end
