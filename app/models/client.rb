class Client
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :users, autosave: true
  has_many :api_configurations, autosave: true
  embeds_many :phone_numbers
  embeds_many :email_addresses

  field :name, type: String
  field :is_active, type: Boolean, default: false # Soft delete

  validates :name, :is_active, presence: true
  validates :name, uniqueness: true
  validate :has_email?

  def has_email?
    if (email_addresses.nil? || email_addresses.size==0)
      errors[:base] << 'Minimum of 1 Email is Required For Client'
    end
  end

end