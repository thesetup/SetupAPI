class Question < ActiveRecord::Base
  include PgSearch
  belongs_to :profile
  validates :birthyear, :gender, :orientation, :occupation, :location,
             presence: true

  pg_search_scope :search, :against => [:birthyear,
                                        :gender,
                                        :orientation,
                                        :occupation,
                                        :location]

end
