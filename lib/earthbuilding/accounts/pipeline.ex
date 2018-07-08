defmodule Earthbuilding.Accounts.Pipeline do
	use Guardian.Plug.Pipeline,
	  otp_app: :earthbuilding,
	  error_handler: Earthbuilding.Accounts.ErrorHandler,
	  module: Earthbuilding.Accounts.Guardian

	# if there is a session token, restrict it to an access token
	plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
	# if there is an authorization header, restrict it to an access token
	plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
	# load the user if either of the verifications worked
	plug Guardian.Plug.LoadResource, allow_blank: true
end
