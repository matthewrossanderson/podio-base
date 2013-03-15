# This seed file reads from the integration specification yaml file
# and loads the data into the database. 

# in the seed.yaml file:
# specify workspaces by their full url including protocol
# for app and field ids, visit the developer/hook page for the app.
# ex: https://blinkapps.podio.com/api-proving-ground/apps/2784930/hooks
# specify apps by their id, use an optional name for yaml file readability
# specify fields by their label from the app builder

# SAMPLE SPECIFICATION:

# ---
# workspaces:
#   -
#     url: https://blinkapps.podio.com/api-proving-ground/
#     apps:
#       -
#         name: Leads  							# this is only used for better readability, not stored
#         id: 2784930
#         fields:
#           - label: Lead contacts 		  # this is only used for readability
#             id: 21327618  					  # this is required
#             required: true 					  # this will be used for app verification 
#           - label: Lead owner
#             id: 21327619
#           - label: Expected total value of lead
#             id: 21327620

Podio.setup(
  :api_url => 'https://api.podio.com',
  :api_key => ENV['PODIO_CLIENT_ID'],
  :api_secret => ENV['PODIO_CLIENT_SECRET']
)

Podio.client.authenticate_with_credentials(ENV['PODIO_EMAIL'], ENV['PODIO_PASSWORD'])

begin
	 specification = YAML.load(File.open(File.join(Rails.root, "db", "seed.yaml"), "r"))
rescue ArgumentError
  puts "Could not parse YAML: #{e.message}"
end

# puts specification

Workspace.delete_all
App.delete_all
Field.delete_all

specification["workspaces"].each do |workspace|

	Workspace.new do |new_workspace|
		podio_space = Podio::Space.find_by_url(workspace["url"])
		new_workspace.id = podio_space.id
		new_workspace.name = podio_space.name

		workspace["apps"].each do |app|

			podio_app = Podio::Application.find(app["id"])
			raise "App not found: #{app["url_label"]}" if podio_app.nil?
	
			new_workspace.apps.build do |new_app|
				new_app.name = podio_app.config["name"]
				new_app.id = podio_app.id

				app["fields"].each do |field|

					podio_field = podio_app.fields.select { |p| p["field_id"] == field["id"] }
					raise "Field not found: #{field["label"]} - #{field["id"]}" if podio_field.length == 0
					raise "Duplicate field found: #{field["label"]} - #{field["id"]}" if podio_field.length > 1
					podio_field = podio_field.first

					new_app.fields.build do |new_field|
						new_field.id = podio_field["field_id"]
						new_field.label = podio_field["config"]["label"]
						new_field.save
					end
				end
				new_app.save
			end
			new_workspace.save
		end
	end
end

