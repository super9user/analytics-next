class ApiConfiguration
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :client

	field :client_id, type: String
	field :client_secret, type: String
	field :hosting_service, type: String, default: "github_service"

	validates :hosting_service, presence: true, uniqueness: { scope: :client }

end
