# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
  when "development", "test"
		client = Client.new(name: ADMINISTRATOR[:client_name])
		admin = User.new(first_name: ADMINISTRATOR[:first_name], last_name: ADMINISTRATOR[:last_name], role: "admin")
		admin.email_addresses << EmailAddress.new(email: ADMINISTRATOR[:user_email])

    client.users << admin
		client.email_addresses << EmailAddress.new(email: ADMINISTRATOR[:client_email])
		client.api_configurations << ApiConfiguration.new(client_id: DEFAULT_CREDS[:client_id],
																											client_secret: DEFAULT_CREDS[:client_secret])
		if client.save
      puts "Client Saved."
    else
      puts "Error"
      puts client.errors.full_messages
    end

end


