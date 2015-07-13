class Profile < ActiveRecord::Base
  belongs_to :user, foreign_key: 'profilee_id', class_name: User
  belongs_to :author, foreign_key: 'profiler_id', class_name: User

  validates :profilee_id, uniqueness: { scope: :profiler_id}


  #validates_uniqueness_of :profiler_id, scope: :profilee_id
  ###currently a user is able to create a profile for himself
  has_many :questions
  has_many :videos, as: :videoable
  has_many :images, as: :imageable

end
