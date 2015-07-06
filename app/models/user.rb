class User < ActiveRecord::Base

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*[0-9]).{4,}/

  validates :password, format: { with: PASSWORD_REGEX,
                                 message: "The password's first character must be a letter,"\
                                           " it must contain at least 4 characters and no more"\
                                           " than 15 characters and no characters other than"\
                                           " letters, numbers and the underscore may be used"}
  validates :password, :access_token, presence: true
  validates :email, uniqueness: true, presence: true
  validates :email, format: { with: EMAIL_REGEX,
                              message: "is not a valid email." }

  before_validation :ensure_access_token

  def ensure_access_token
    if self.access_token.blank?
      self.access_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(access_token: token)
      token = SecureRandom.hex
    end
    token
  end

end
