class Profile < ActiveRecord::Base
  belongs_to :user, foreign_key: 'profilee_id', class_name: User
  belongs_to :author, foreign_key: 'profiler_id', class_name: User
  validates_uniqueness_of :profilee_id, scope: :profiler_id,
                           message: 'cannot be same as Profiler'

  # validates_uniqueness_of :profilee_id, scope: :profiler_id
end
