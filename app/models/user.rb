class User < ApplicationRecord
    has_secure_password
    enum role: [:host, :contractor]
    validates :email, presence: true, uniqueness: true 
    validates :role, :inclusion => {in: roles.keys}
end
