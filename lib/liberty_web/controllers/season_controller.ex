defmodule LibertyWeb.SeasonController do
  use LibertyWeb, :controller

  alias Liberty.Scoring
  alias Liberty.Scoring.Season

  action_fallback LibertyWeb.FallbackController

  def index(conn, _params) do
    seasons = Scoring.list_seasons()
    render(conn, "index.json", seasons: seasons)
  end

  def create(conn, %{"season" => season_params}) do
    with {:ok, %Season{} = season} <- Scoring.create_season(season_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.season_path(conn, :show, season))
      |> render("show.json", season: season)
    end
  end

  def show(conn, %{"id" => id}) do
    season = Scoring.get_season!(id)
    render(conn, "show.json", season: season)
  end

  def update(conn, %{"id" => id, "season" => season_params}) do
    season = Scoring.get_season!(id)

    with {:ok, %Season{} = season} <- Scoring.update_season(season, season_params) do
      render(conn, "show.json", season: season)
    end
  end

  def delete(conn, %{"id" => id}) do
    season = Scoring.get_season!(id)

    with {:ok, %Season{}} <- Scoring.delete_season(season) do
      send_resp(conn, :no_content, "")
    end
  end
end
