# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eve-alert_session',
  :secret      => '6aee7d598606d0fbedf13ac09d1c2e95861b649604b31288609662fb9a8094be907daf44419dcc25895ef93cccc164bd161805470bd7dba56f7a47a27bbbb352'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
