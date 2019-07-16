defmodule LibertyWeb.SeasonControllerTest do
  use LibertyWeb.ConnCase

  alias Liberty.Scoring
  alias Liberty.Scoring.Season

  @create_attrs %{
    dates: [],
    title: "some title"
  }
  @update_attrs %{
    dates: [],
    title: "some updated title"
  }
  @invalid_attrs %{dates: nil, title: nil}

  def fixture(:season) do
    {:ok, season} = Scoring.create_season(@create_attrs)
    season
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all seasons", %{conn: conn} do
      conn = get(conn, Routes.season_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create season" do
    test "renders season when data is valid", %{conn: conn} do
      conn = post(conn, Routes.season_path(conn, :create), season: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.season_path(conn, :show, id))

      assert %{
               "id" => id,
               "dates" => [],
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.season_path(conn, :create), season: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update season" do
    setup [:create_season]

    test "renders season when data is valid", %{conn: conn, season: %Season{id: id} = season} do
      conn = put(conn, Routes.season_path(conn, :update, season), season: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.season_path(conn, :show, id))

      assert %{
               "id" => id,
               "dates" => [],
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, season: season} do
      conn = put(conn, Routes.season_path(conn, :update, season), season: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete season" do
    setup [:create_season]

    test "deletes chosen season", %{conn: conn, season: season} do
      conn = delete(conn, Routes.season_path(conn, :delete, season))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.season_path(conn, :show, season))
      end
    end
  end

  defp create_season(_) do
    season = fixture(:season)
    {:ok, season: season}
  end
end
