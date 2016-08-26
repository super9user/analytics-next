class EmailAddress
	include Mongoid::Document
	include Mongoid::Timestamps

	embedded_in :user
	embedded_in :client

	field :email, type: String
	field :email_type,type: String, default: "personal"

	validates :email, :email_type, presence: true
	validates_uniqueness_of :email, :scope => :user_id
	validates_format_of :email, with: /\A[^@]+@[^@]+\z/

end