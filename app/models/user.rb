class User < ActiveRecord::Base

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  PW_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}\z/

  validates :password, format: { with: PW_REGEX,
                                 message: "must contain at least 4 characters"\
                                          " and at least one number" }
  validates :email, :password, :access_token, presence: true

  validates :email, uniqueness: true, format: { with: EMAIL_REGEX,
                                                message: "is not a valid email" }

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
