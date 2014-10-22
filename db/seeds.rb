# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Job.all.delete_all

users = User.create (
	[
		{
			name: "Steve Marshall",
			email: "hello@sjmarshalluk.com",
			username: "sjmarshalluk",
			password: "steve1",
			password_confirmation: "steve1"
		},
		{
			name: "Rob Marshall",
			email: "hello@rjmarshalluk.com",
			username: "rjmarshalluk",
			password: "rob1",
			password_confirmation: "rob1"
		}
	]
)

jobs = Job.create (
	[
		{
			title: "Senior Designer",
			company: "Mint Digital",
			company_url: "www.mintdigital.com",
			job_url: "www.mintdigital.com/jobs",
			job_email: "steve@mintdigital.com",
			description: "Lovely job",
			user_id: "2",
			area_of_london: "Hackney",
			salary: "20,000",
			how_to_apply: "Send us an email"
		},
		{
			title: "Junior Designer",
			company: "DeskBeers",
			company_url: "www.deskbeers.com",
			job_url: "www.deskbeers.com/jobs",
			job_email: "steve@deskbeers.com",
			description: "Drink beer, get paid",
			user_id: "2",
			area_of_london: "Shoreditch",
			salary: "10,000",
			how_to_apply: "Come by and say helle"
		}


	]
)