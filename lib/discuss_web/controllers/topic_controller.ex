defmodule DiscussWeb.TopicController do
    use DiscussWeb, :controller
    alias Discuss.{Repo, Topic}

    def index(conn, _params) do
      topics = Repo.all(Topic)
      render(conn, "index.html", topics: topics)
    end

    def new(conn, _params) do
        changeset = Topic.changeset(%Topic{}, %{title: ""})
        render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"topic" => topic}) do
        changeset = Topic.changeset(%Topic{}, topic)
        case Repo.insert(changeset) do
            {:ok, post} ->
                conn
                |> put_flash(:info, "Topic created")
                |> redirect(to: Routes.topic_path(conn, :index))
            {:error, changeset} -> IO.inspect(changeset)
                render(conn, "new.html", changeset: changeset)
        end
    end
end
