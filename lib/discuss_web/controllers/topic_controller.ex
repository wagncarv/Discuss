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
            {:ok, _post} ->
                conn
                |> put_flash(:info, "Topic created")
                |> redirect(to: Routes.topic_path(conn, :index))
            {:error, changeset} -> IO.inspect(changeset)
                render(conn, "new.html", changeset: changeset)
        end
    end

    def edit(conn, %{"id" => topic_id}) do
        topic = Repo.get(Topic, topic_id)
        changeset = Topic.changeset(topic)
        render(conn, "edit.html", changeset: changeset, topic: topic)
    end

    def update(conn, %{"id" => topic_id, "topic" => topic}) do
        old_topic = Repo.get(Topic, topic_id)
        changeset  = Topic.changeset(old_topic, topic)

        case Repo.update(changeset) do
            {:ok, _topic} ->
                conn
                |> put_flash(:info, "Topic updated!")
                |> redirect(to: Routes.topic_path(conn, :index))
            {:error, changeset} ->
                render(conn, "edit.html", changeset: changeset, topic: old_topic)
        end
    end

    def delete(conn, %{"id" => topic_id}) do
        Topic
        |> Repo.get(topic_id)
        |> Repo.delete!() |> IO.inspect(label: "delete")
        conn
        |> put_flash(:info, "Topic deleted!")
        |> redirect(to: Routes.topic_path(conn, :index))
    end
end
