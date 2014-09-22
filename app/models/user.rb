class User < ActiveRecord::Base
  # dis seems wrong...
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


  def status
    (read_attribute :status) || '<strong>Hello World!</strong>'
  end

protected


end
