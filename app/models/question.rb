class Question < ActiveRecord::Base
  belongs_to :profile
  validates :name, :email, :birthyear, :gender, :orientation,
            :occupation, :location, :profile_id, presence: true

  validates :profile_id, uniqueness: true

end
