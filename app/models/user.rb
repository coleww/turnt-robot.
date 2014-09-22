class User < ActiveRecord::Base

  attr_accessible :status, :username, :password

  has_secure_password

  validates :password,
            length: {
              minimum: 6,
              maximum: 255
            },
            allow_nil: true

  validates :username,
            presence: true,
            uniqueness: true,
            length: {
              minimum: 3,
              maximum: 255
            }

  validates :session_token,
            presence: true


  after_initialize :ensure_session_token

  class << self

    def generate_session_token
      SecureRandom::urlsafe_base64(16)
    end

  end

  def status
    (read_attribute :status) || '<strong>Hello World!</strong>'
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
