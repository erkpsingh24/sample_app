# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '85744317fdd633a8458a8eab30510a6d292206ba6038db630f0e4ab231d5c773719d835811cd98194becb01fa16264a44f1797c24eeafba7ae65e2d83292beac'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		#Use the existing token
		File.read(token_file).chomp
	else
		#Generate a new token a store it in token_file
		token =SecureRandom.hex(64)
		File.write(token_file,token)
		token_file
	end
end

SampleApp::Application.config.secret_key_base = secure_token