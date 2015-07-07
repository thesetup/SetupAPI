class User < ActiveRecord::Base

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*[0-9]).{4,}/

  validates :password, format: { with: PASSWORD_REGEX,
                                 message: "must contain at least 4 characters"\
                                          " and at least one number"}
  validates :password, :email, :access_token, presence: true

  validates :email, uniqueness: true, format: { with: EMAIL_REGEX,
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
