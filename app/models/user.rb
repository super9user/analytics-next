class User
	include Mongoid::Document
	include Mongoid::Timestamps

	default_scope  -> { order(:created_at => :asc) }

	embeds_many :phone_numbers
	embeds_many :email_addresses
	belongs_to :client

	field :first_name, type: String
	field :last_name, type: String
	field :time_zone, type: String, default: "Pacific Time (US & Canada)"
	field :role, type: String
	field :is_active, type: Boolean, default: false # Soft delete

	validates :first_name, :last_name, :time_zone, :role, :is_active, presence: true
	validate :has_email?

	def has_email?
		if (email_addresses.nil? || email_addresses.size==0)
			errors[:base] << 'Minimum of 1 Email is Required For User'
		end
	end

end