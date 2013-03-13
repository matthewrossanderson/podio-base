== Podio Base App

This application is the basis for Blink Custom Podio Integrations.

== Preparations on Podio

Create an API key by logging into Podio and go to Account Settings in the My Account dropdown. Then go to the API Keys tab and write a name and a domain for this app. While you are developing, you probably want to set the domain to localhost:3000 or similar.

== Configuration

You must put your API key and secret in the environment variables PODIO_CLIENT_ID and PODIO_CLIENT_SECRET.  For development you can use the figaro gem, which sources them from application.yml


== Features

- Podio Omniauth, extended to retrieve extra user details/picture

- Twitter Bootstrap for a great basis for styling

- HAML/SASS for blazing fast HTML/CSS 

- Caching with Dalli (memcache)

- Testing with Guard, Spork, Rspec, VCR

- App / Fields Stored in Database (sourced from csvs with rake db:seed )

== Planned Features

- DelayedJob
- Hook-based actions/notifications
- More to come! 
