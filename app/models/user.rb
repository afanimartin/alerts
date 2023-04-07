class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  has_many :alerts, dependent: :destroy

  before_create :generate_access_token, :generate_unique_id

  private
    def generate_access_token
      loop do
        self.access_token = SecureRandom.base58(24)
        break unless User.exists?(access_token: access_token)
      end
    end

    def generate_unique_id
      self.id = SecureRandom.base58(12)
    end
end
