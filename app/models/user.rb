class User < ApplicationRecord
    
    validates :name, presence: true, uniqueness: true
  has_secure_password
    
    def downcase_email
      self.email = email.downcase
    end


    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
