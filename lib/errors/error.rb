#parent class
class Error < StandardError

	def initialize(msg="There was an unknown error")
		case get_severity
			when ERROR_SEVERITY[:high]
				#TODO - Email to Core Team, Log in error logging system

			when ERROR_SEVERITY[:medium]
				#TODO - Log in error logging system
		end
		super(msg)
	end

	private
	# override if necessary
	# Options are listed in constants.rb file
	def get_severity
		return ERROR_SEVERITY[:medium]
	end

end