class User < ActiveRecord::Base

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  PW_REGEX = /\A(?-i)(?=^.{8,}$)((?!.*\s)(?=.*[A-Z])(?=.*[a-z]))((?=(.*\d){1,})|(?=(.*\W){1,}))^.*$\z/

  before_save :hash_password
  before_validation :ensure_access_token
  validates :password, format: { with: PW_REGEX,
                                 message: " must be at least 8 characters and include: at least one"\
                                          " capital letter, one lower case letter and one number"\
                                          " or special character." }

  validates :email, uniqueness: true, format: { with: EMAIL_REGEX,
                                                message: "is not a valid email" }


  def hash_password
    self.password = Digest::SHA1.hexdigest(password)
  end

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
