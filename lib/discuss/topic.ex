defmodule Discuss.Topic do
    use Ecto.Schema
    # import Ecto
    # import Ecto.{Changeset, Query}
    import Ecto.Changeset
    alias Ecto.Changeset

    @required_fields [:title]

    schema "topics" do
        field :title, :string
        timestamps()
    end

    def changeset(struct \\ %__MODULE__{}, params \\ %{}) do
        struct
        |> cast(params, @required_fields)
        |> validate_required(@required_fields)
    end

end
