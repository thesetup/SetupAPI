class Profile < ActiveRecord::Base
  belongs_to :user, foreign_key: 'profilee_id', class_name: 'User'
  belongs_to :author, foreign_key: 'profiler_id', class_name: 'User'
end
