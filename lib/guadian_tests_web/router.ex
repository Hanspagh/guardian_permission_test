defmodule GuadianTestsWeb.Router do
  use GuadianTestsWeb, :router

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
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug GuadianTestsWeb.AuthPipeline
  end

  scope "/" do
    pipe_through :browser

    get "/", GuadianTestsWeb.PageController, :index
  end

  scope "/api/", GuadianTestsWeb do
    pipe_through :browser
    get "/user/sign_in_admin", UserController, :sign_in_admin
    get "/user/sign_in", UserController, :sign_in
  end

  scope "/api/", GuadianTestsWeb do
    pipe_through [:browser, :auth]

    get "/user/admin", UserController, :admin

    resources "/user", UserController, except: [:new, :edit, :create]
  end


end
