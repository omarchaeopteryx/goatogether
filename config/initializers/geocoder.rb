Geocoder.configure(
  # geocoding service (see below for supported options):
  :lookup => :google,
  # IP address geocoding service (see below for supported options):
  :ip_lookup => :google,
  :use_https => true,

   # to use an API key:
  :api_key => ENV["GOOGLE_API_KEY"],



   # geocoding service request timeout, in seconds (default 3):
   :timeout => 10
)
