defmodule LibertyWeb.SeasonView do
  use LibertyWeb, :view
  alias LibertyWeb.SeasonView

  def render("index.json", %{seasons: seasons}) do
    %{data: render_many(seasons, SeasonView, "season.json")}
  end

  def render("show.json", %{season: season}) do
    %{data: render_one(season, SeasonView, "season.json")}
  end

  def render("season.json", %{season: season}) do
    %{id: season.id,
      title: season.title,
      dates: season.dates}
  end
end
