class Alert < ApplicationRecord
  belongs_to :user

  validates :alert_type, presence: true

  self.primary_key = :id
  before_create :generate_unique_id

  private
    def generate_unique_id
      self.id = SecureRandom.base58(12)
    end
end
