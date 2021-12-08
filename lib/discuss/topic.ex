defmodule Discuss.Topic do
    use Ecto.Schema
    import Ecto.Changeset

    @required_fields [:title]
    @derive {Jason.Encoder, only: [:id, :title]}
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
