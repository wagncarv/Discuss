defmodule Discuss.Router do
  use Discuss.Web, :router

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

  scope "/", Discuss do
    pipe_through :browser # Use the default browser stack

    # get "/", PageController, :index
    # get "/", TopicController, :index
    # Rotas
    # get "/topics/new", TopicController, :new
    # create
    # post "/topics", TopicController, :create
    # Edit
    # get "/topics/:id/edit", TopicController, :edit
    # Update
    # put "/topics/:id", TopicController, :update
    # 

    resources "/", TopicController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
