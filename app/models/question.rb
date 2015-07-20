class Question < ActiveRecord::Base
  belongs_to :profile
  validates :birthyear, :gender, :orientation, :occupation, :location,
             presence: true

end
