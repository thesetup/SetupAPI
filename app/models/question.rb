class Question < ActiveRecord::Base
  # include PgSearch
  belongs_to :profile
  validates :birthyear, :gender, :orientation, :occupation, :location,
             presence: true

<<<<<<< HEAD
  pg_search_quote :search, :against => [:birthyear,
                                        :gender,
                                        :orientation,
                                        :occupation,
                                        :location]
=======
>>>>>>> e038b53b14a9cd63c5a503e511d6936bf27a40f8
end
