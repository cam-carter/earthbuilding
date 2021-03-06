defmodule EarthbuildingWeb.Router do
  use EarthbuildingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

	pipeline :auth do
		plug Earthbuilding.Accounts.Pipeline
	end

	pipeline :ensure_auth do
		plug Guardian.Plug.EnsureAuthenticated
	end

  scope "/", EarthbuildingWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index

		resources "/users", UserController

		get "/login", SessionController, :new
		post "/login", SessionController, :login
		post "/logout", SessionController, :logout
  end

	scope "/", EarthbuildingWeb do
		pipe_through [:browser, :auth, :ensure_auth]

		get "/secret", PageController, :secret
	end

  # Other scopes may use custom stacks.
  # scope "/api", EarthbuildingWeb do
  #   pipe_through :api
  # end
end
