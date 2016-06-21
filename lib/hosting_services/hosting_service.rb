#strategy pattern
class HostingService

	def initialize
		api_configuration = ApiConfiguration.first

		unless(HOSTING_SERVICES_SUPPORTED.include? (api_configuration.hosting_service) )
			raise HostingServiceError.new
		end
	end

end