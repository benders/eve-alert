# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_eve-alert.rails_3_session',
  :secret => '3e240e615d9bb3e93a08b3511a8e000b1ab1430d547768ecc8282a99c0b68aa768561fa6f653a959d37dbfec05ce2d0270eed0b9ae083cfe00718532fc6875d6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
