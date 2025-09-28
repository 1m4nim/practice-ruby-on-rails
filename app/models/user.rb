class User < ApplicationRecord
  # Devise Modules:
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
end