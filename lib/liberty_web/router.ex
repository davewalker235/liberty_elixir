defmodule LibertyWeb.Router do
  use LibertyWeb, :router

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

  if Mix.env == :dev do
    forward "/api/ui", Absinthe.Plug.GraphiQL, schema: Liberty.Schema
  end

  forward "/api", Absinthe.Plug, schema: Liberty.Schema


  scope "/", LibertyWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/:path", PageController, :index

  end

  # Other scopes may use custom stacks.
  # scope "/api", LibertyWeb do
  #   pipe_through :api
  # end
end
