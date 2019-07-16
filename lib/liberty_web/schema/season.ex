defmodule Liberty.Schema.Season do
  use Absinthe.Schema.Notation

  @desc "A racing season"
  object :season do
    field :id, :id
    field :title, :string
    field :dates, list_of(:datetime),
      description: "This is a sequential list of the start dates for each "
        <> "series in a season. It is used to break out scores by series"
  end

end
