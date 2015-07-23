class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => {
                                          medium: '300x300>',
                                          square: '200x200#',
                                          thumb: '100x100>'
                                        }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  PW_REGEX = /\A(?-i)(?=^.{8,}$)((?!.*\s)(?=.*[A-Z])(?=.*[a-z]))((?=(.*\d){1,})|(?=(.*\W){1,}))^.*$\z/

  before_save :hash_password
  before_validation :ensure_access_token
    validates :password, format: { with: PW_REGEX,
                                   message: " must be at least 8 characters and include: at least one"\
                                            " capital letter, one lower case letter and one number"\
                                            " or special character." }

    validates :email, uniqueness: true, presence: true, format: { with: EMAIL_REGEX,
                                                        message: "is not a valid email" }

    validates :username, uniqueness: true, presence: true
    has_many :created_profiles, class_name: "Profile", foreign_key: :profiler_id
    has_one :made_profile, class_name: "Profile", foreign_key: :profilee_id, dependent: :destroy

  def hash_password
    if self.password.length < 39
    self.password = Digest::SHA1.hexdigest(password)
    end
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

  def as_json(opts={})
    defaults = {
      except: [:access_token, :password]
    }
    super(defaults.merge(opts))
  end

end
