defmodule DiscussWeb.TopicController do
    use DiscussWeb, :controller

    def new(conn, _params) do
        conn
        |> put_status(:ok)
        |> json(%{message: "NEW!"})
    end
end
