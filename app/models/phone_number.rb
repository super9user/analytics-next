class PhoneNumber
	include Mongoid::Document
	include Mongoid::Timestamps

	embedded_in :user
	embedded_in :client

	field :ph_number, type: String
	field :phone_type, type: String, default: "personal"
	field :dial_code, type: String    # 91, 1
	field :country_code, type: String # IN, US, SNG

	validates :ph_number, :phone_type, presence: true
	validates_uniqueness_of :ph_number, :scope => :user_id
	validates_format_of :ph_number, with: /\A(?<num>\d+)\z/
  
end
