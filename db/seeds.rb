# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_users = User.where(role: "admin")
if(admin_users.count==0)
	admin = User.new(first_name: ADMINISTRATOR[:first_name], last_name: ADMINISTRATOR[:last_name], role: "admin")
	e = EmailAddress.new(email: ADMINISTRATOR[:email])
	admin.email_addresses << e
	admin.save
end

ApiConfiguration.create(client_id: DEFAULT_CREDS[:client_id], client_secret: DEFAULT_CREDS[:client_secret])
