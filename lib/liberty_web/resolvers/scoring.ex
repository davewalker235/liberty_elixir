defmodule Liberty.Resolvers.Scoring do

  def list_seasons(_id, _args, _resolution) do
    {:ok, now} = DateTime.now("Etc/UTC")
    {:ok, %{id: "1", title: "2019 Wednesdays", dates: [now, now, now]}}
  end
end
