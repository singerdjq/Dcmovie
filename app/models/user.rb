class User < ApplicationRecord
     attr_accessor :remember_token, :reset_token
   
    has_many :microposts, dependent: :destroy
    validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
    
    def downcase_email
      self.email = email.downcase
    end


    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
    def feed
    Micropost.where("user_id = ?", id)
  end
     def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end


  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
    
    def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
    
end
