class Profile < ActiveRecord::Base
  belongs_to :user, foreign_key: 'profilee_id', class_name: User
  belongs_to :author, foreign_key: 'profiler_id', class_name: User

  validates :profilee_id, presence: {message: 'cannot be the same as Profiler'}, uniqueness: { scope: :profiler_id}

  has_one :question, dependent: :destroy
  has_many :videos, as: :videoable, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  
end
