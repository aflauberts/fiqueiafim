# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fiqueiafim_session',
  :secret      => 'd9cd3b7d2d66c1e1883eace79a0c3b68436ccca4daaee7b8420771542c2f9cb2ed88c6f4911504b1d4563d4ce63311ce0c8ccd1bca75d149d410a16c7e0885d9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
