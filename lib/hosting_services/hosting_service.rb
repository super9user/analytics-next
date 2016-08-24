#strategy pattern
class HostingService

	def initialize
		service_string = ApiConfiguration.first.nil? ? '' : ApiConfiguration.first.hosting_service

		raise HostingServiceError.new unless HOSTING_SERVICES_SUPPORTED.include? (service_string)
		@service = service_string.camelize.constantize
	end

end