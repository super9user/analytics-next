class HostingServiceError < Error

	def initialize(msg="Hosting Service Not Found")
		super(msg)
	end

	def get_severity
		return ERROR_SEVERITY[:high]
	end

end