defmodule Liberty.Scoring.Season do
  use Ecto.Schema
  import Ecto.Changeset

  schema "seasons" do
    field :dates, {:array, :date}
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(season, attrs) do
    season
    |> cast(attrs, [:title, :dates])
    |> validate_required([:title, :dates])
  end
end
